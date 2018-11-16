

		program engine_data_format


		implicit none

!		i_alt = 1,		0k	feet	
!		i_alt = 2,		1k	feet	
!		i_alt = 3,		2k	feet	
!		i_alt = 4,		3k	feet	
!		i_alt = 5,		4k	feet	
!		i_alt = 6,		5k	feet	
!		i_alt = 7,		6k	feet	
!		i_alt = 8,		7k	feet	
!		i_alt = 9,		8k	feet	
!		i_alt = 10,		9k	feet	
!		i_alt = 11,		10k	feet	
!		i_alt = 12,		15k	feet	
!		i_alt = 13,		20k	feet	
!		i_alt = 14,		25k	feet	
!		i_alt = 15,		30k	feet	
!		i_alt = 16,		35k	feet	
!		i_alt = 17,		40k	feet	
!		i_alt = 18,		45k	feet	
!		i_alt = 19,		50k	feet	

!		i_mach =  1,	0.0
!		i_mach =  2,	0.1
!		i_mach =  3,	0.2
!		i_mach =  4,	0.3
!		i_mach =  5,	0.4
!		i_mach =  6,	0.5
!		i_mach =  7,	0.6
!		i_mach =  8,	0.7
!		i_mach =  9,	0.8
!		i_mach =  10,	0.9

!		i_pla =  1,		20 deg
!		i_pla =  2,		35 deg
!		i_pla =  3,		45 deg
!		i_pla =  4,		50 deg
!		i_pla =  5,		55 deg
!		i_pla =  6,		60 deg
!		i_pla =  7,		65 deg
!		i_pla =  8,		70 deg
!		i_pla =  9,		75 deg
!		i_pla =  10,	80 deg
!		i_pla =  11,	83 deg


		character*500	string500,blank500

!		real*4			r_data(19,10,11,41)
		real*4			r_data(19,10,11,54)

		integer*4		i,i_alt,i_mach,i_pla





		do 1 i=1,500
			blank500(i:i) = ' '
1		enddo


		open(unit=10,file='out18.txt',status='old')		

		open(unit=11,file='out18_fn.map',status='unknown')			! Net thrust (lbf)

		open(unit=12,file='out18_wft.map',status='unknown')			! Total Fuel Flow (lbm/hr)

		open(unit=13,file='out18_w2a.map',status='unknown')			! Total Air Flow (lbm/sec)

		open(unit=14,file='out18_t6.map',status='unknown')			! Core Side Mixing Plane Temperature (deg R)

		open(unit=15,file='out18_t16.map',status='unknown')			! Duct Side Mixing Plane Temperature (deg R)

		open(unit=16,file='out18_t6a.map',status='unknown')			! Mixing Plane Mixed Mass Temperature (deg R)

		open(unit=17,file='out18_pamb.map',status='unknown')		! Pressure Ambient (psia)

		open(unit=18,file='out18_tamb.map',status='unknown')		! Temperature Ambient (deg R)

		open(unit=19,file='out18_w2ar.map',status='unknown')		! Corrected Total Air Flow at Engine Face (lbm/sec)


!		bleed info
		open(unit=20,file='out18_ttbli.map',status='unknown')		! Interstage bleed total temperature (F)

		open(unit=21,file='out18_ttblc.map',status='unknown')		! HPC discharge bleed temperature (F)

		open(unit=22,file='out18_ptbli.map',status='unknown')		! Interstage bleed total pressure (psia)

		open(unit=23,file='out18_ptblc.map',status='unknown')		! HPC discharge bleed pressure (psia)


!		nozzle info
		open(unit=24,file='out18_tt9.map',status='unknown')			! Nozzle exit total temperature (F)

		open(unit=25,file='out18_ts9.map',status='unknown')			! Nozzle exit static temperature (F)

		open(unit=26,file='out18_pt9.map',status='unknown')			! Nozzle exit total pressure (psia)

		open(unit=27,file='out18_ps9.map',status='unknown')			! Nozzle exit static pressure (psia)

		open(unit=28,file='out18_rho9.map',status='unknown')		! Nozzle exit gas flow density (lbm/ft^3)

		open(unit=29,file='out18_xm9.map',status='unknown')			! Nozzle discharge mach #

		open(unit=30,file='out18_v9.map',status='unknown')			! Nozzle discharge velocity (ft/sec)


!		engine cooling info
		open(unit=31,file='out18_tt2p5c.map',status='unknown')		! Fan exit duct side temperature (F)

		open(unit=32,file='out18_tt6c.map',status='unknown')		! Duct side mixing plane temperature (F)


		write(11,'(A3)') '#3D'
		write(11,*) '-- Net Thrust (lbf)'
		write(11,*) '-- Mach no.'
		write(11,*) '10'
		write(11,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(11,*) '-- Power Lever Angle (degrees)'
		write(11,*) '11'
		write(11,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(11,*) '-- Altitude (feet)'
		write(11,*) '19'
		write(11,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(11,*)

		write(12,'(A3)') '#3D'
		write(12,*) '-- Total Fuel Flow (lbm/hr)'
		write(12,*) '-- Mach no.'
		write(12,*) '10'
		write(12,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(12,*) '-- Power Lever Angle (degrees)'
		write(12,*) '11'
		write(12,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(12,*) '-- Altitude (feet)'
		write(12,*) '19'
		write(12,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(12,*)

		write(13,'(A3)') '#3D'
		write(13,*) '-- Total Air Flow (lbm/sec)'
		write(13,*) '-- Mach no.'
		write(13,*) '10'
		write(13,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(13,*) '-- Power Lever Angle (degrees)'
		write(13,*) '11'
		write(13,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(13,*) '-- Altitude (feet)'
		write(13,*) '19'
		write(13,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(13,*)

		write(14,'(A3)') '#3D'
		write(14,*) '-- Core Side Mixing Plane Temperature (deg R)'
		write(14,*) '-- Mach no.'
		write(14,*) '10'
		write(14,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(14,*) '-- Power Lever Angle (degrees)'
		write(14,*) '11'
		write(14,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(14,*) '-- Altitude (feet)'
		write(14,*) '19'
		write(14,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(14,*)

		write(15,'(A3)') '#3D'
		write(15,*) '-- Duct Side Mixing Plane Temperature (deg R)'
		write(15,*) '-- Mach no.'
		write(15,*) '10'
		write(15,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(15,*) '-- Power Lever Angle (degrees)'
		write(15,*) '11'
		write(15,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(15,*) '-- Altitude (feet)'
		write(15,*) '19'
		write(15,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(15,*)

		write(16,'(A3)') '#3D'
		write(16,*) '-- Mixing Plane Mixed Mass Temperature (deg R)'
		write(16,*) '-- Mach no.'
		write(16,*) '10'
		write(16,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(16,*) '-- Power Lever Angle (degrees)'
		write(16,*) '11'
		write(16,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(16,*) '-- Altitude (feet)'
		write(16,*) '19'
		write(16,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(16,*)

		write(17,'(A3)') '#3D'
		write(17,*) '-- Pressure Ambient (psia)'
		write(17,*) '-- Mach no.'
		write(17,*) '10'
		write(17,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(17,*) '-- Power Lever Angle (degrees)'
		write(17,*) '11'
		write(17,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(17,*) '-- Altitude (feet)'
		write(17,*) '19'
		write(17,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(17,*)

		write(18,'(A3)') '#3D'
		write(18,*) '-- Temperature Ambient (deg R)'
		write(18,*) '-- Mach no.'
		write(18,*) '10'
		write(18,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(18,*) '-- Power Lever Angle (degrees)'
		write(18,*) '11'
		write(18,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(18,*) '-- Altitude (feet)'
		write(18,*) '19'
		write(18,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(18,*)

		write(19,'(A3)') '#3D'
		write(19,*) '-- Corrected Total Air Flow at Engine Face (lbm/sec)'
		write(19,*) '-- Mach no.'
		write(19,*) '10'
		write(19,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(19,*) '-- Power Lever Angle (degrees)'
		write(19,*) '11'
		write(19,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(19,*) '-- Altitude (feet)'
		write(19,*) '19'
		write(19,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(19,*)


!		bleed info
		write(20,'(A3)') '#3D'
		write(20,*) '-- Interstage bleed total temperature (F)'
		write(20,*) '-- Mach no.'
		write(20,*) '10'
		write(20,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(20,*) '-- Power Lever Angle (degrees)'
		write(20,*) '11'
		write(20,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(20,*) '-- Altitude (feet)'
		write(20,*) '19'
		write(20,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(20,*)

		write(21,'(A3)') '#3D'
		write(21,*) '-- HPC discharge bleed temperature (F)'
		write(21,*) '-- Mach no.'
		write(21,*) '10'
		write(21,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(21,*) '-- Power Lever Angle (degrees)'
		write(21,*) '11'
		write(21,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(21,*) '-- Altitude (feet)'
		write(21,*) '19'
		write(21,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(21,*)

		write(22,'(A3)') '#3D'
		write(22,*) '-- Interstage bleed total pressure (psia)'
		write(22,*) '-- Mach no.'
		write(22,*) '10'
		write(22,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(22,*) '-- Power Lever Angle (degrees)'
		write(22,*) '11'
		write(22,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(22,*) '-- Altitude (feet)'
		write(22,*) '19'
		write(22,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(22,*)

		write(23,'(A3)') '#3D'
		write(23,*) '-- HPC discharge bleed pressure (psia)'
		write(23,*) '-- Mach no.'
		write(23,*) '10'
		write(23,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(23,*) '-- Power Lever Angle (degrees)'
		write(23,*) '11'
		write(23,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(23,*) '-- Altitude (feet)'
		write(23,*) '19'
		write(23,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(23,*)


!		nozzle info
		write(24,'(A3)') '#3D'
		write(24,*) '-- Nozzle exit total temperature (F)'
		write(24,*) '-- Mach no.'
		write(24,*) '10'
		write(24,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(24,*) '-- Power Lever Angle (degrees)'
		write(24,*) '11'
		write(24,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(24,*) '-- Altitude (feet)'
		write(24,*) '19'
		write(24,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(24,*)

		write(25,'(A3)') '#3D'
		write(25,*) '-- Nozzle exit static temperature (F)'
		write(25,*) '-- Mach no.'
		write(25,*) '10'
		write(25,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(25,*) '-- Power Lever Angle (degrees)'
		write(25,*) '11'
		write(25,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(25,*) '-- Altitude (feet)'
		write(25,*) '19'
		write(25,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(25,*)

		write(26,'(A3)') '#3D'
		write(26,*) '-- Nozzle exit total pressure (psia)'
		write(26,*) '-- Mach no.'
		write(26,*) '10'
		write(26,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(26,*) '-- Power Lever Angle (degrees)'
		write(26,*) '11'
		write(26,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(26,*) '-- Altitude (feet)'
		write(26,*) '19'
		write(26,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(26,*)

		write(27,'(A3)') '#3D'
		write(27,*) '-- Nozzle exit static pressure (psia)'
		write(27,*) '-- Mach no.'
		write(27,*) '10'
		write(27,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(27,*) '-- Power Lever Angle (degrees)'
		write(27,*) '11'
		write(27,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(27,*) '-- Altitude (feet)'
		write(27,*) '19'
		write(27,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(27,*)

		write(28,'(A3)') '#3D'
		write(28,*) '-- Nozzle exit gas flow density (lbm/ft^3)'
		write(28,*) '-- Mach no.'
		write(28,*) '10'
		write(28,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(28,*) '-- Power Lever Angle (degrees)'
		write(28,*) '11'
		write(28,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(28,*) '-- Altitude (feet)'
		write(28,*) '19'
		write(28,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(28,*)

		write(29,'(A3)') '#3D'
		write(29,*) '-- Nozzle discharge mach #'
		write(29,*) '-- Mach no.'
		write(29,*) '10'
		write(29,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(29,*) '-- Power Lever Angle (degrees)'
		write(29,*) '11'
		write(29,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(29,*) '-- Altitude (feet)'
		write(29,*) '19'
		write(29,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(29,*)

		write(30,'(A3)') '#3D'
		write(30,*) '-- Nozzle discharge velocity (ft/sec)'
		write(30,*) '-- Mach no.'
		write(30,*) '10'
		write(30,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(30,*) '-- Power Lever Angle (degrees)'
		write(30,*) '11'
		write(30,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(30,*) '-- Altitude (feet)'
		write(30,*) '19'
		write(30,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(30,*)


!		engine cooling info
		write(31,'(A3)') '#3D'
		write(31,*) '-- Fan exit duct side temperature (F)'
		write(31,*) '-- Mach no.'
		write(31,*) '10'
		write(31,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(31,*) '-- Power Lever Angle (degrees)'
		write(31,*) '11'
		write(31,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(31,*) '-- Altitude (feet)'
		write(31,*) '19'
		write(31,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(31,*)

		write(32,'(A3)') '#3D'
		write(32,*) '-- Duct side mixing plane temperature (F)'
		write(32,*) '-- Mach no.'
		write(32,*) '10'
		write(321,*) '	0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9'
		write(32,*) '-- Power Lever Angle (degrees)'
		write(32,*) '11'
		write(32,*) '	20.0 35.0 45.0 50.0 55.0 60.0 65.0 70.0 75.0 80.0 83.0'
		write(32,*) '-- Altitude (feet)'
		write(32,*) '19'
		write(32,'(A145)') '0.0 1000.0 2000.0 3000.0 4000.0 5000.0 6000.0 7000.0 8000.0 9000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 45000.0 50000.0'
		write(32,*)



		string500 = blank500
		read(10,*) string500
		read(10,*) string500


		do 100 i_alt=1,19
!		do 100 i_alt=1,32

			do 200 i_mach=1,10

				do 300 i_pla=1,11

!					read(10,*) (r_data(i_alt,i_mach,i_pla,i),i=1,41)
					read(10,*) (r_data(i_alt,i_mach,i_pla,i),i=1,54)

!					write(11,'(41f12.4)') (r_data(i_alt,i_mach,i_pla,i),i=1,41)

300				enddo

200			enddo

100		enddo

		close(unit=10)

!		close(unit=11)



		do 1100 i_alt=1,19
!		do 1100 i_alt=1,32

			write(11,*) '-- i_alt =',i_alt
			write(11,*)

			write(12,*) '-- i_alt =',i_alt
			write(12,*)

			write(13,*) '-- i_alt =',i_alt
			write(13,*)

			write(14,*) '-- i_alt =',i_alt
			write(14,*)

			write(15,*) '-- i_alt =',i_alt
			write(15,*)

			write(16,*) '-- i_alt =',i_alt
			write(16,*)

			write(17,*) '-- i_alt =',i_alt
			write(17,*)

			write(18,*) '-- i_alt =',i_alt
			write(18,*)

			write(19,*) '-- i_alt =',i_alt
			write(19,*)

			write(20,*) '-- i_alt =',i_alt
			write(20,*)

			write(21,*) '-- i_alt =',i_alt
			write(21,*)

			write(22,*) '-- i_alt =',i_alt
			write(22,*)

			write(23,*) '-- i_alt =',i_alt
			write(23,*)

			write(24,*) '-- i_alt =',i_alt
			write(24,*)

			write(25,*) '-- i_alt =',i_alt
			write(25,*)

			write(26,*) '-- i_alt =',i_alt
			write(26,*)

			write(27,*) '-- i_alt =',i_alt
			write(27,*)

			write(28,*) '-- i_alt =',i_alt
			write(28,*)

			write(29,*) '-- i_alt =',i_alt
			write(29,*)

			write(30,*) '-- i_alt =',i_alt
			write(30,*)

			write(31,*) '-- i_alt =',i_alt
			write(31,*)

			write(32,*) '-- i_alt =',i_alt
			write(32,*)

			do 1200 i_pla=1,11

				i = 7		! net thrust

				write(11,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 10		! total fuel flow

				write(12,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 12		! total air flow

				write(13,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 23		! engine core temperature

				write(14,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 24		! fan duct temperature

				write(15,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 25		! mixing plane mixed mass temperature

				write(16,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 36		! ambient pressure

				write(17,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 37		! ambient temperature

				write(18,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 13		! total corrected air flow at engine face conditions

				write(19,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)


!				bleed info
				i = 42		! Interstage bleed total temperature (F)

				write(20,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 43		! HPC discharge bleed temperature (F)

				write(21,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 44		! Interstage bleed total pressure (psia)

				write(22,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 45		! HPC discharge bleed pressure (psia)

				write(23,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)


!				nozzle info
				i = 46		! Nozzle exit total temperature (F)

				write(24,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 47		! Nozzle exit static temperature (F)

				write(25,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 48		! Nozzle exit total pressure (psia)

				write(26,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 49		! Nozzle exit static pressure (psia)

				write(27,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 50		! Nozzle exit gas flow density (lbm/ft^3)

				write(28,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 51		! Nozzle discharge mach #

				write(29,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 52		! Nozzle discharge velocity (ft/sec)

				write(30,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)


!				engine cooling info
				i = 53		! Fan exit duct side temperature (F)

				write(31,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)

				i = 54		! Duct side mixing plane temperature (F)

				write(32,'(10f12.4)')	r_data(i_alt,1,i_pla,i),		&
				&						r_data(i_alt,2,i_pla,i),		&
				&						r_data(i_alt,3,i_pla,i),		&
				&						r_data(i_alt,4,i_pla,i),		&
				&						r_data(i_alt,5,i_pla,i),		&
				&						r_data(i_alt,6,i_pla,i),		&
				&						r_data(i_alt,7,i_pla,i),		&
				&						r_data(i_alt,8,i_pla,i),		&
				&						r_data(i_alt,9,i_pla,i),		&
				&						r_data(i_alt,10,i_pla,i)





1200		enddo

			write(11,*)
			write(12,*)
			write(13,*)
			write(14,*)
			write(15,*)
			write(16,*)
			write(17,*)
			write(18,*)
			write(19,*)

			write(20,*)
			write(21,*)
			write(22,*)
			write(23,*)
			write(24,*)
			write(25,*)
			write(26,*)
			write(27,*)
			write(28,*)
			write(29,*)
			write(30,*)

1100	enddo



		close(unit=11)
		close(unit=12)
		close(unit=13)
		close(unit=14)
		close(unit=15)
		close(unit=16)
		close(unit=17)
		close(unit=18)
		close(unit=19)

		close(unit=20)
		close(unit=21)
		close(unit=22)
		close(unit=23)
		close(unit=24)
		close(unit=25)
		close(unit=26)
		close(unit=27)
		close(unit=28)
		close(unit=29)
		close(unit=30)







		end program engine_data_format


