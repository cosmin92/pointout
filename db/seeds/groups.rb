# This file should contain all groups records
# Group(name, description, logo, parent)

@i_fantastici = Group.create(
    :name => "I Fantastici",
    :description => "Aliquam vestibulum at enim nec imperdiet. Maecenas dapibus risus vel mollis cursus. Quisque convallis sapien eget felis mattis, id pretium turpis feugiat. Morbi velit libero, placerat ac quam eget, mollis vulputate est. Mauris blandit, libero ac varius dignissim, mauris urna venenatis nulla, vel commodo sapien odio at neque. Suspendisse maximus mi aliquam ligula vestibulum, non rutrum felis tincidunt. Nulla mollis, odio vitae imperdiet dignissim, purus leo dapibus urna, ac dictum dui mi quis magna.",
    :logo => File.open(File.join(Rails.root, "public/images/groups/i_fantastici.jpg"))
)

@pirati_di_montagna = Group.create(
    :name => "Pirati di Montagna",
    :description => "Mauris id sem orci. Integer elementum leo sed arcu aliquam, sed facilisis sem dapibus. Proin vestibulum ut dui ac ornare. Morbi a risus eu arcu aliquet mattis ornare nec erat. Sed vel nibh tellus. Maecenas sed pulvinar diam, sit amet dictum urna. Suspendisse auctor maximus luctus. Integer blandit ac velit non pellentesque. Integer ultrices fringilla ipsum, at accumsan nulla placerat efficitur. Morbi lobortis dignissim sem ut aliquam. Vivamus sit amet nunc mauris.",
    :logo => File.open(File.join(Rails.root, "public/images/groups/pirati_di_montagna.png"))
)

@scudo_rosso = Group.create(
    :name => "Scudo Rosso",
    :description => "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ut mi sed risus feugiat ultrices. Nulla bibendum accumsan risus eget congue. Etiam viverra enim non urna viverra fringilla. Vivamus semper enim non quam commodo, sed venenatis risus molestie. Donec accumsan tempor arcu vitae rutrum. Sed neque dui, rhoncus eu suscipit vitae, fermentum sed mauris. Vivamus interdum lectus et nulla dictum mollis. Ut mattis vestibulum odio vestibulum consectetur. Sed efficitur lacus arcu, nec laoreet urna interdum non. Cras vestibulum et nisi non hendrerit. Sed ac leo elit.",
    :logo => File.open(File.join(Rails.root, "public/images/groups/scudo_rosso.png")),
)
