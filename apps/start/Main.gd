extends Control

func _ready():
	# Connect signals for Strapi
	$CenterContainer/VBoxContainer/StrapiHBox/StrapiDownloadButton.pressed.connect(_on_strapi_download_pressed)
	$CenterContainer/VBoxContainer/StrapiHBox/StrapiInstallButton.pressed.connect(_on_strapi_install_pressed)

	# Connect signals for Django
	$CenterContainer/VBoxContainer/DjangoHBox/DjangoDownloadButton.pressed.connect(_on_django_download_pressed)
	$CenterContainer/VBoxContainer/DjangoHBox/DjangoInstallButton.pressed.connect(_on_django_install_pressed)


# ----------------------------------------------------------------
#                    STRAPI
# ----------------------------------------------------------------

func _on_strapi_download_pressed():
	print("Downloading Strapi...")

	var clone_cmd = "git clone https://github.com/teknokomo/up-app-strapi.git ../strapi"
	var clone_args = PackedStringArray(["-c", clone_cmd])
	
	var output_clone = []
	var exit_code = OS.execute("bash", clone_args, output_clone, true)

	print("Strapi clone output:", output_clone)
	if exit_code == 0:
		print("Strapi repository has been downloaded to ../strapi")
	else:
		print("Error downloading Strapi, code:", exit_code)


func _on_strapi_install_pressed():
	print("Installing Strapi...")

	# Now referencing the new install/linux.sh
	var install_cmd = "chmod +x ../strapi/install/linux.sh && cd ../strapi && ./install/linux.sh"
	var install_args = PackedStringArray(["-c", install_cmd])
	
	var output_install = []
	var exit_code = OS.execute("bash", install_args, output_install, true)

	print("Strapi install output:", output_install)
	if exit_code == 0:
		print("Strapi has been successfully installed!")
	else:
		print("Error installing Strapi, code:", exit_code)


# ----------------------------------------------------------------
#                    DJANGO
# ----------------------------------------------------------------

func _on_django_download_pressed():
	print("Downloading Django...")

	var clone_cmd = "git clone https://github.com/teknokomo/up-app-django.git ../django"
	var clone_args = PackedStringArray(["-c", clone_cmd])
	
	var output_clone = []
	var exit_code = OS.execute("bash", clone_args, output_clone, true)

	print("Django clone output:", output_clone)
	if exit_code == 0:
		print("Django repository has been downloaded to ../django")
	else:
		print("Error downloading Django, code:", exit_code)


func _on_django_install_pressed():
	print("Installing Django...")

	# Now referencing the new install/linux.sh
	var install_cmd = "chmod +x ../django/install/linux.sh && cd ../django && ./install/linux.sh"
	var install_args = PackedStringArray(["-c", install_cmd])
	
	var output_install = []
	var exit_code = OS.execute("bash", install_args, output_install, true)

	print("Django install output:", output_install)
	if exit_code == 0:
		print("Django has been successfully installed!")
	else:
		print("Error installing Django, code:", exit_code)
