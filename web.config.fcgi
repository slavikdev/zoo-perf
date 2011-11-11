<?xml version="1.0" encoding="UTF-8"?>
<configuration>
  <system.webServer>

	<heliconZoo>
	  <application name="rails.project.x86" >
	    <environmentVariables>
		  <add name="RACK_ENV" value="production" />
		</environmentVariables>
      </application>

	  <application name="rails.project.x64" >
	    <environmentVariables>
		  <add name="RACK_ENV" value="production" />
		</environmentVariables>
      </application>
	</heliconZoo>


    <!--
    <engine name="ruby.1.9.pipe4" fullPath="%SystemDrive%\Ruby19\bin\ruby.exe" arguments="%SystemDrive%\Zoo\Workers\ruby\zack.rb" minInstances="4" maxInstances="4" />
    -->

    <handlers>
      <add name="rails.project.x86" scriptProcessor="ruby.1.9.pipe4"  path="*" verb="*" modules="HeliconZoo_x86" preCondition="bitness32" resourceType="Unspecified" requireAccess="Script" />
      <add name="rails.project.x64" scriptProcessor="ruby.1.9.pipe4"  path="*" verb="*" modules="HeliconZoo_x64" preCondition="bitness64" resourceType="Unspecified" requireAccess="Script" />
    </handlers>

  </system.webServer>
</configuration>