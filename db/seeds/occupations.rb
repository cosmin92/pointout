# This file should contain all occupations records
# Occupation(group, tipology)

Occupation.create(:group => @i_fantastici, :tipology => @unknown)
Occupation.create(:group => @i_fantastici, :tipology => @illuminazione_pubblica)
Occupation.create(:group => @i_fantastici, :tipology => @illuminazione_stradale)

Occupation.create(:group => @i_fantastici, :tipology => @ambiente)
Occupation.create(:group => @i_fantastici, :tipology => @decoro_publico)

Occupation.create(:group => @pirati_di_montagna, :tipology => @randagismo )
Occupation.create(:group => @pirati_di_montagna, :tipology => @rifiuti_pulizia)
Occupation.create(:group => @pirati_di_montagna, :tipology => @problemi_idrici)

Occupation.create(:group => @scudo_rosso, :tipology => @segnaletica_stradale)
Occupation.create(:group => @scudo_rosso, :tipology => @altro)