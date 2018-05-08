# This file should contain all the tipologies record

# Tipology.new(
#   :name,
#   :description,
#   :logo,
#)

@unknown = Tipology.create(
    :name => "Unknown",
    :description => "A questa tipologia di problemi, aggiunta di default, vengono assegnati tutti i report la cui tipologia viene cancellata. Oppure è utile per per quei ti ti problematiche di cui non si sa anticipatamente la tipologia di appartenenza",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/unknown.png'))
)

@illuminazione_pubblica = Tipology.create(
    :name => "Illuminazione pubblica",
    :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam risus risus, porta cursus placerat eget, suscipit ac risus. Integer eu ligula ac eros sagittis dictum. Aenean quis tincidunt tellus. Suspendisse nec augue malesuada, auctor nulla ac, convallis est. Integer accumsan et tortor nec tempor. Praesent eget pharetra nisl. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin congue magna quis libero sagittis convallis. Morbi eu eleifend magna. Pellentesque varius justo nec justo tincidunt sollicitudin.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/illuminazione_pubblica.png'))
)

@illuminazione_stradale = Tipology.create(
    :name => "Illuminazione stradale",
    :description => "Praesent ornare, libero a suscipit ullamcorper, nunc magna posuere eros, eu lobortis mi tortor id libero. Aenean in accumsan nisl. Donec non interdum neque. Curabitur ac ornare justo. Ut neque sem, tempor nec eros eget, vulputate eleifend neque. Suspendisse congue, sapien facilisis suscipit hendrerit, elit nibh varius lorem, at maximus magna quam non urna. Morbi nec turpis et purus venenatis suscipit ut id dolor. Cras iaculis elit velit, quis convallis eros efficitur euismod. Phasellus vitae egestas felis, non feugiat arcu. Vestibulum molestie dignissim lectus, in vehicula magna efficitur sit amet. Suspendisse potenti. Curabitur euismod aliquam nulla. Quisque lacinia convallis tellus eget condimentum. Quisque sollicitudin congue elit vel tincidunt. Sed et orci convallis, tincidunt tellus ac, feugiat est. Etiam nec vehicula metus. ",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/illuminazione_stradale.png')),
    :parent => @illuminazione_pubblica
)

@ambiente = Tipology.create(
    :name => "Ambiente",
    :description => "Integer placerat vehicula aliquam. Duis consectetur sapien lacus, ut placerat diam mattis eget. Praesent venenatis ac augue a interdum. Nam et consectetur odio. Quisque pharetra, metus ut lobortis bibendum, ante eros tincidunt massa, lobortis facilisis quam erat quis tortor. Vestibulum lacus ligula, ultrices vel sem in, cursus accumsan urna. Donec orci neque, sagittis sed laoreet quis, finibus quis eros. Curabitur sed eleifend nisi, commodo vestibulum sem. Curabitur interdum eleifend purus, id mollis lectus malesuada quis. Sed lobortis massa hendrerit, luctus massa sit amet, interdum purus. Donec sapien ipsum, elementum at purus non, malesuada rutrum enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/ambiente.jpeg'))
)

@decoro_publico = Tipology.create(
    :name => "Decoro publico",
    :description => "Vestibulum nulla massa, vulputate at tellus vitae, posuere maximus mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ac diam elit. Sed mollis consequat posuere. Curabitur ac urna malesuada, scelerisque velit dapibus, pharetra tortor. Cras et elementum ipsum. Nullam luctus risus odio, id pharetra ex mollis fringilla. Integer sed gravida tellus. Donec bibendum nisl imperdiet urna auctor, tristique finibus diam sagittis. Sed justo libero, lobortis eget viverra et, malesuada ac augue.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/decoro_pubblico.png')),
    :parent => @ambiente
)

@randagismo = Tipology.create(
    :name => "Randagismo",
    :description => "Maecenas quis lorem mi. Vestibulum tempus diam id ligula tincidunt, ac finibus nunc malesuada. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc at dapibus mi, ornare sodales mauris. Vivamus luctus eros dui, sit amet tempor erat pretium a. Aliquam placerat viverra venenatis. Etiam viverra sagittis ornare. Aliquam malesuada volutpat ante at tempus. Sed non tellus nec massa pulvinar pharetra at quis diam. Morbi cursus rhoncus nisi, sit amet aliquet ex porttitor in. Quisque pulvinar libero ac nibh imperdiet, ac porttitor quam maximus. Vestibulum elementum, neque nec viverra rhoncus, mi dui faucibus turpis, eget dignissim nunc ipsum at arcu. Duis ullamcorper arcu sed nulla eleifend fermentum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/randagismo.png'))
)

@rifiuti_pulizia = Tipology.create(
    :name => "Rifiuti e pulizia",
    :description => "Etiam eu tincidunt leo. Sed at elementum urna, id tincidunt urna. Sed lacinia dui libero, a porta justo lacinia id. Praesent at est tellus. Morbi efficitur orci at eros malesuada finibus. Proin ultrices ex magna, at egestas leo cursus et. Praesent in dolor ultricies est congue porta. Proin interdum hendrerit magna, non luctus ante iaculis id. Maecenas enim diam, condimentum fringilla felis non, laoreet rhoncus enim. Ut sed molestie lectus, eget cursus diam. Suspendisse porttitor, diam ac placerat vulputate, tellus lectus mollis tortor, vel tincidunt sem augue et odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In eu quam eu nisi luctus sodales.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/rifiuti_pulizia.jpg')),
    :parent => @decoro_publico
)

@problemi_idrici = Tipology.create(
    :name => "Problemi idrici",
    :description => "Curabitur iaculis egestas arcu, ac fermentum odio vehicula sed. Cras nibh mauris, pulvinar sed nisi ut, faucibus posuere libero. Nam gravida metus at ante euismod, et vehicula nibh sollicitudin. Nam semper euismod mi at pulvinar. Morbi gravida nisi elit, vel eleifend massa fringilla at. Morbi feugiat nibh et diam lacinia, ut eleifend eros rhoncus. Praesent volutpat eleifend lacus. Maecenas aliquam diam quis rutrum congue. In lorem felis, ornare vel convallis sit amet, blandit in nibh.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/problemi_idrici.png'))
)

@segnaletica_stradale = Tipology.create(
    :name => "Segnaletica stradale",
    :description => "Aenean quam turpis, varius vel rutrum in, condimentum eu risus. Donec hendrerit sed ante id consequat. Quisque id leo elementum, dignissim purus eget, ultricies erat. Donec tempus aliquet mattis. Maecenas elementum enim at turpis consequat, mattis dictum nisi imperdiet. Praesent et risus sit amet magna faucibus aliquet. Nunc ut gravida urna. Etiam ut justo nec felis ultrices venenatis eu vitae enim. Vivamus rutrum odio turpis, eget sollicitudin enim finibus at. Sed eleifend enim in augue tempus molestie. Suspendisse eu nunc maximus, dictum enim feugiat, fringilla mi. Maecenas feugiat dictum massa ac dapibus.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/segnaletica_stradale.png')),
    :parent => @ambiente
)

@altro = Tipology.create(
    :name => "Altro",
    :description => "Nullam maximus dapibus tellus ac pretium. Etiam ut purus sed mi fermentum porta at quis augue. Phasellus in enim eget sapien vestibulum blandit. Nam at nulla nibh. Proin lobortis urna quis erat aliquam, vitae consequat erat iaculis. Nulla non justo sit amet sapien sollicitudin faucibus. Aenean ornare ullamcorper justo eget iaculis. Sed malesuada orci vitae facilisis pellentesque. Nam placerat, diam id vestibulum dapibus, quam arcu placerat libero, vitae laoreet lectus lectus quis justo. Donec ut porta sapien. Phasellus nibh felis, condimentum sed ex ut, consectetur sodales nibh.",
    :logo => File.open(File.join(Rails.root, 'public/images/tipologies/altro.png'))
)



