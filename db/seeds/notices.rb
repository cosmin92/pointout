# This file should contain all notices records
# Notice(title, content, posting_date, expiration_date, notice_type, forwarder, group)

Notice.create(
    :title => "Lorem Ipsum",
    :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis consectetur neque. Curabitur hendrerit nulla neque, quis molestie eros posuere non. Morbi convallis turpis et maximus iaculis. Praesent quis urna magna. Cras congue metus quis odio laoreet condimentum. Phasellus sit amet felis pellentesque, vestibulum lectus non, sollicitudin tortor. Nunc condimentum facilisis dui, sed facilisis lacus lacinia non. In sapien neque, cursus vitae sem et, tincidunt tristique sem. In hendrerit libero lacus, ut ullamcorper magna placerat quis. Etiam mollis cursus arcu, sed maximus urna ultricies a.",
    :posting_date => DateTime.strptime("15/10/2012", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("15/10/2022", "%d/%m/%Y"),
    :notice_type => "Information",
    :forwarder => @isaac_newton,
    :group => @i_fantastici
)

Notice.create(
    :title => "Cos’è Lorem Ipsum?",
    :content => "Donec fermentum mi a orci pellentesque scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas quis tortor ut augue cursus ullamcorper. Vestibulum eget maximus nulla, vitae rhoncus sapien. Morbi dignissim felis et arcu vestibulum, eget volutpat urna mattis. Etiam ornare bibendum odio in aliquet. Donec elementum faucibus felis at suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce pretium porttitor sem at vestibulum. Quisque ac nisl nunc. Nam a turpis mi. Donec hendrerit mi id nulla tincidunt molestie.",
    :posting_date => DateTime.strptime("15/10/2012", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("15/10/2022", "%d/%m/%Y"),
    :notice_type => "Warning",
    :forwarder => @galileo_galilei,
    :group => @i_fantastici
)

Notice.create(
    :title => "Perchè lo utilizziamo?",
    :content => "Suspendisse pretium, lectus non luctus imperdiet, metus dolor vulputate sem, quis commodo erat nulla in orci. Suspendisse ornare sed risus nec tincidunt. Nam rhoncus ante eu nulla suscipit ornare ac quis urna. Duis convallis ante urna, et dictum sapien rutrum quis. Suspendisse sed odio varius, laoreet arcu vitae, semper nibh. Aliquam ut porttitor ligula. Duis et ante sed diam iaculis consectetur vitae eu tortor. Nunc eu nisl sed est vehicula venenatis ut fermentum est. Quisque vitae odio ante.",
    :posting_date => DateTime.strptime("15/10/2012", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("15/10/2022", "%d/%m/%Y"),
    :notice_type => "Obbligation",
    :forwarder => @giulio_cesare,
    :group => @pirati_di_montagna
)

Notice.create(
    :title => "Da dove viene?",
    :content => "Nullam tellus mi, pulvinar vel ligula et, pharetra placerat lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eu aliquam quam. Curabitur sagittis vehicula nisl, dictum sodales odio vehicula a. Mauris a erat neque. Donec sagittis sapien sit amet justo vehicula, sed rutrum arcu aliquet. In volutpat finibus erat, vel viverra quam pretium sit amet. Sed eu libero eget velit malesuada elementum sit amet vel risus. Proin quis dui id tortor suscipit hendrerit. Vestibulum leo libero, congue condimentum congue non, faucibus ut ante. Donec vel dui at dolor feugiat sollicitudin at feugiat erat. Pellentesque et pellentesque est. Etiam consectetur diam et dictum rutrum.",
    :posting_date => DateTime.strptime("15/10/2012", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("15/10/2022", "%d/%m/%Y"),
    :notice_type => "Information",
    :forwarder => @giulio_cesare,
    :group => @pirati_di_montagna
)

Notice.create(
    :title => "Dove posso trovarlo?",
    :content => "Fusce lobortis, ex eu hendrerit vulputate, urna risus tincidunt nisi, ac blandit lacus eros sed ligula. Aenean ac nisi at neque vehicula pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut porttitor nisl, id consectetur eros. Nunc varius ac nulla in commodo. Nam et massa mauris. Fusce et dapibus ante, sit amet condimentum ante. Suspendisse risus mauris, consequat ac sapien non, ornare pharetra erat. Aenean congue diam quis neque lobortis egestas. Praesent fringilla lectus non tellus pulvinar maximus. Aliquam viverra lectus sed lacus molestie, in consequat dui vehicula. Sed ullamcorper libero at orci finibus tempor. Ut faucibus metus quis molestie ultrices. Proin volutpat auctor tincidunt. Quisque neque felis, eleifend sed augue a, semper accumsan elit. Duis mollis non sem nec dapibus.",
    :posting_date => DateTime.strptime("15/10/2012", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("15/10/2022", "%d/%m/%Y"),
    :notice_type => "Result",
    :forwarder => @giulio_cesare,
    :group => @pirati_di_montagna
)