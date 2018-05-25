# This file should contain all address books records
# AddressBook(name, note, group, forwarder)

@enti_illuminazione_pubblica = AddressBook.create(
    :name => "Enti per problemi di Illuminazione Pubblica",
    :note => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis consectetur neque. Curabitur hendrerit nulla neque, quis molestie eros posuere non. Morbi convallis turpis et maximus iaculis. Praesent quis urna magna. Cras congue metus quis odio laoreet condimentum. Phasellus sit amet felis pellentesque, vestibulum lectus non, sollicitudin tortor. Nunc condimentum facilisis dui, sed facilisis lacus lacinia non. In sapien neque, cursus vitae sem et, tincidunt tristique sem. In hendrerit libero lacus, ut ullamcorper magna placerat quis. Etiam mollis cursus arcu, sed maximus urna ultricies a.",
    :group => @i_fantastici,
    :forwarder => @isaac_newton
)

@enti_illuminazione_stradale = AddressBook.create(
    :name => "Enti per problemi di Illuminazione Stradale",
    :note => "Donec fermentum mi a orci pellentesque scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas quis tortor ut augue cursus ullamcorper. Vestibulum eget maximus nulla, vitae rhoncus sapien. Morbi dignissim felis et arcu vestibulum, eget volutpat urna mattis. Etiam ornare bibendum odio in aliquet. Donec elementum faucibus felis at suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce pretium porttitor sem at vestibulum. Quisque ac nisl nunc. Nam a turpis mi. Donec hendrerit mi id nulla tincidunt molestie.",
    :group => @i_fantastici,
    :forwarder => @isaac_newton
)

@enti_ambiente = AddressBook.create(
    :name => "Enti per problemi di Ambientali",
    :note => "Suspendisse pretium, lectus non luctus imperdiet, metus dolor vulputate sem, quis commodo erat nulla in orci. Suspendisse ornare sed risus nec tincidunt. Nam rhoncus ante eu nulla suscipit ornare ac quis urna. Duis convallis ante urna, et dictum sapien rutrum quis. Suspendisse sed odio varius, laoreet arcu vitae, semper nibh. Aliquam ut porttitor ligula. Duis et ante sed diam iaculis consectetur vitae eu tortor. Nunc eu nisl sed est vehicula venenatis ut fermentum est. Quisque vitae odio ante.",
    :group => @i_fantastici,
    :forwarder => @galileo_galilei
)

@enti_rifiuti_pulizia = AddressBook.create(
    :name => "Enti per problemi di Riufiuti e Pulizia",
    :note => "Nullam tellus mi, pulvinar vel ligula et, pharetra placerat lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eu aliquam quam. Curabitur sagittis vehicula nisl, dictum sodales odio vehicula a. Mauris a erat neque. Donec sagittis sapien sit amet justo vehicula, sed rutrum arcu aliquet. In volutpat finibus erat, vel viverra quam pretium sit amet. Sed eu libero eget velit malesuada elementum sit amet vel risus. Proin quis dui id tortor suscipit hendrerit. Vestibulum leo libero, congue condimentum congue non, faucibus ut ante. Donec vel dui at dolor feugiat sollicitudin at feugiat erat. Pellentesque et pellentesque est. Etiam consectetur diam et dictum rutrum.",
    :group => @pirati_di_montagna,
    :forwarder => @giulio_cesare
)

@enti_segnaletica_stradale = AddressBook.create(
    :name => "Enti per problemi di Segnaletica Stradale",
    :note => "Fusce lobortis, ex eu hendrerit vulputate, urna risus tincidunt nisi, ac blandit lacus eros sed ligula. Aenean ac nisi at neque vehicula pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut porttitor nisl, id consectetur eros. Nunc varius ac nulla in commodo. Nam et massa mauris. Fusce et dapibus ante, sit amet condimentum ante. Suspendisse risus mauris, consequat ac sapien non, ornare pharetra erat. Aenean congue diam quis neque lobortis egestas. Praesent fringilla lectus non tellus pulvinar maximus. Aliquam viverra lectus sed lacus molestie, in consequat dui vehicula. Sed ullamcorper libero at orci finibus tempor. Ut faucibus metus quis molestie ultrices. Proin volutpat auctor tincidunt. Quisque neque felis, eleifend sed augue a, semper accumsan elit. Duis mollis non sem nec dapibus.",
    :group => @scudo_rosso,
    :forwarder => @carlo_magno
)