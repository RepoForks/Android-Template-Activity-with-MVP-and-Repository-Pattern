<?xml version="1.0"?>
<recipe>
   <#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
       <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+" />
    </#if>

    <#if (buildApi gte 22) && appCompat && !(hasDependency('com.android.support:design'))>
        <dependency mavenUrl="com.android.support:design:${buildApi}.+" />
    </#if>

    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="root/res/values/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

    <merge from="root/res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <instantiate from="root/res/layout/activity_login.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
				   
	<instantiate from="root/src/app_package/MainView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}View.java" />
				   
    <instantiate from="root/src/app_package/MVPLoginActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <instantiate from="root/src/app_package/MVPLoginPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityPresenter}.java" />
	
	<instantiate from="root/src/app_package/PresenterView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityPresenter}View.java" />
				   
    <instantiate from="root/src/app_package/Model.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${modelClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
	<open file="${escapeXmlAttribute(srcOut)}/${modelClass}.java" />
	<open file="${escapeXmlAttribute(srcOut)}/${activityPresenter}.java" />

</recipe>
