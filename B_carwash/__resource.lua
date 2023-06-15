resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'B_autopesula'

author 'Broken#4642'

version '1.0'

shared_script 'config.lua'

server_scripts {
	'@es_extended/locale.lua',
	's/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'c/*.lua'
}

dependency 'es_extended'