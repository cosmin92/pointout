# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Dir[File.join(Rails.root, "db", "seeds", "*.rb")].sort.each do |seed|
#   load seed
# end

load File.join(Rails.root, "db", "seeds", "signalers.rb")
# Create Signalers: 
#   @mario_rossi
#   @pinco_pallino
#   @pippo_baldo
#   @barba_rossa
#   @maria_antonietta

load File.join(Rails.root, "db", "seeds", "groups.rb")
# Create Groups:
#   @i_fantastici
#   @pirati_di_montagna
#   @scudo_rosso

load File.join(Rails.root, "db", "seeds", "forwarders.rb")
# Create forwarders:
#   @isaac_newton => @i_fantastici, boss
#   @galileo_galilei => @i_fantastici, boss
#   @giulio_cesare => @pirati_di_montagna, boss
#   @carlo_magno => @scudo_rosso, boss
#   @giovanni_giolitti => @scudo_rosso
#   @oriana_allaci => @scudo_rosso
#   @rita_levi_montalcini => @i_fantastici
#   @maria_montessori => @pirati_di_montagna

load File.join(Rails.root, "db", "seeds", "tipologies.rb")
# Create tipologies:
#   @unknown => @isaac_newton
#   @illuminazione_pubblica => @isaac_newton
#   @illuminazione_stradale => @isaac_newton, @illuminazione_pubblica
#   @ambiente => @galileo_galilei
#   @decoro_publico => @galileo_galilei, @ambiente
#   @randagismo => @giulio_cesare
#   @rifiuti_pulizia => @giulio_cesare, @decoro_publico
#   @problemi_idrici => @giulio_cesare
#   @segnaletica_stradale => @carlo_magno, @ambiente
#   @altro => @carlo_magno

load File.join(Rails.root, "db", "seeds", "reports.rb")
# Create reports:
#   @buche_sulla_strada => @barba_rossa, @ambiente
#   @palo_luce_rotto => @pinco_pallino, @illuminazione_stradale
#   @rifiuti => @mario_rossi, @rifiuti_pulizia

load File.join(Rails.root, "db", "seeds", "observations.rb")
# Create observations:
#   @o1_buche_sulla_strada => @barba_rossa
#   @o2_buche_sulla_strada => @pinco_pallino
#   @o1_palo_luce_rotto => @barba_rossa
#   @o2_palo_luce_rotto => @pinco_pallino
#   @o1_rifiuti => @barba_rossa
#   @o2_rifiuti => @mario_rossi

load File.join(Rails.root, "db", "seeds", "tags.rb")
# Create tags:

load File.join(Rails.root, "db", "seeds", "occupations.rb")
# Create occupations:
#   @i_fantastici => @unknown
#   @i_fantastici => @illuminazione_pubblica
#   @i_fantastici => @illuminazione_stradale
#   @i_fantastici => @ambiente
#   @i_fantastici => @decoro_publico
#   @priati_di_montagna => @randagismo
#   @priati_di_montagna => @rifiuti_pulizia
#   @priati_di_montagna => @problemi_idrici
#   @scudo_rosso => @segnaletica_stradale
#   @scudo_rosso => @altro

load File.join(Rails.root, "db", "seeds", "address_books.rb")
# Create address books:
#   @enti_illuminazione_pubblica => @i_fantastici, @isaac_newton
#   @enti_illuminazione_stradale => @i_fantastici, @isaac_newton
#   @enti_ambiente => @i_fantastici, @galileo_galilei
#   @enti_rifiuti_pulizia => @pirati_di_montagna, @giulio_cesare
#   @enti_segnaletica_stradale => @scudo_rosso, @carlo_magno

load File.join(Rails.root, "db", "seeds", "agencies.rb")
# Crete agencies:
#   @anas_spa_direzione_centrale => @isaac_newton
#   @anas_spa_autoparco_della_direzione_generale => @galileo_galilei
#   @ama_sede_di_zona => @giulio_cesare
#   @anas_area_compartimentale_lazio => @carlo_magno
#   @comune_di_roma_dipartimento_iii => @giovanni_giolitti
#   @comune_di_roma_servizio_giardini => @oriana_fallaci
#   @autostrade_per_italia => @rita_levi_montalcini
#   @roma_capitale => @maria_montessori

load File.join(Rails.root, "db", "seeds", "contacts.rb")

load File.join(Rails.root, "db", "seeds", "notices.rb")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?