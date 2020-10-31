<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
<v-card-text>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                    <#if usernameEditDisabled??>
                        <v-text-field 
                          label="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>" 
                          value="${(login.username!'')}"
                          id="username"
                          name="username"
                          tabindex="1"
                          disabled
                        >
                        </v-text-field>
                    <#else>
                        <v-text-field
                          label="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                          value="${(login.username!'')}"
                          :rules="[rules.required]"           
                          prepend-icon="person" 
                          clear-icon="clear"         
                          id="username"
                          name="username"
                          tabindex="1"
                          autofocus
                          autocomplete="off"
                          clearable
                        >
                        </v-text-field>
                    </#if>

                    <v-text-field
                      :rules="[rules.required]"            
                      :append-icon="showpassword ? 'visibility' : 'visibility_off'"              
                      prepend-icon="lock"
                      :type="showpassword ? 'text' : 'password'"
                      id="password"
                      name="password"
                      autocomplete="off"
                      label="${msg("password")}"
                      @click:append="showpassword = !showpassword"
                      tabindex="2"
                    ></v-text-field> 

                        <#if realm.rememberMe && !usernameEditDisabled??>
                                    <#if login.rememberMe??>
                                        <v-switch 
                                          label="${msg("rememberMe")}"
                                          tabindex="3" 
                                          id="rememberMe" 
                                          name="rememberMe"
                                          :value="true"
                                        >
                                        </v-switch>
                                    <#else>
                                        <v-switch
                                          label="${msg("rememberMe")}"
                                          tabindex="3"
                                          id="rememberMe"
                                          name="rememberMe"
                                          :value="true"
                                        >
                                        </v-switch>
                                    </#if>
                        </#if>
                        <#if realm.resetPasswordAllowed>
                            <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>

	      </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                <v-btn 
                  block 
                  color="primary"
                  name="login"
                  id="kc-login"
                  @click="submit"
                  :loading="loading"
                  type="submit"
                  tabindex="4"
                >
                  ${msg("doLogIn")}
                </v-btn>
             </v-card-actions>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
        </#if>
    </#if>

</@layout.registrationLayout>
