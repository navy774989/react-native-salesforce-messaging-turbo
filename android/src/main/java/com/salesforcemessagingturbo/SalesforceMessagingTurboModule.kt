package com.salesforcemessagingturbo

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.module.annotations.ReactModule
import com.salesforce.android.smi.core.*
import com.salesforce.android.smi.network.data.domain.prechat.PreChatField
import com.salesforce.android.smi.ui.*
import java.net.URL
import java.util.UUID

@ReactModule(name = SalesforceMessagingTurboModule.NAME)
class SalesforceMessagingTurboModule(reactContext: ReactApplicationContext) :
  NativeSalesforceMessagingTurboSpec(reactContext) {
  var config :  UIConfiguration? = null

  override fun configureMessagingService(
    serviceAPIUrl: String?,
    organizationId: String?,
    developerName: String?
  ): String? {
    if(organizationId == null) return null
    if(developerName == null) return  null
    serviceAPIUrl?.let {
      val url = URL(it)
      val coreConfig = CoreConfiguration(url, organizationId, developerName)
      val conversationID = UUID.randomUUID()
      config = UIConfiguration(coreConfig, conversationID)
      return  conversationID.toString()
    }
    return null
  }

  override fun openChatPage() {
    config?.let {
      config ->
      val activity = reactApplicationContext.currentActivity
      activity?.let { currentActivity ->
        val uiClient = UIClient.Factory.create(config)
        uiClient.openConversationActivity(currentActivity)
      }
    }
  }

  override fun setPreChatData(data: ReadableMap?) {
    config?.let {
      val coreClient = CoreClient.Factory.create(reactApplicationContext, it)
      coreClient.registerHiddenPreChatValuesProvider(object : PreChatValuesProvider {
        override suspend fun setValues(input: List<PreChatField>): List<PreChatField> {
          input.forEach {
            data?.getString(it.name)?.let {
              value->
              it.userInput = value
            }


          }
          return input
        }
      })
    }
  }

  companion object {
    const val NAME = "SalesforceMessagingTurbo"
  }
}
