From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the rockchip
 and sunxi trees
Date: Wed, 20 Sep 2017 12:26:09 +1000
Message-ID: <20170920122609.2cbade55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750733AbdITC0L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Sep 2017 22:26:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomas Novotny <tomas@novotny.cz>, Jagan Teki <jagan@amarulasolutions.com>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  50544f39018f ("dt-bindings: Add vendor prefix for Amarula Solutions")

from the rockchip tree, commit:

  912620c02c31 ("dt-bindings: add vendor prefix for Touchless Biometric Systems AG")

from the sunxi tree and commit:

  e6262a54124d ("dt-bindings: vendor-prefixes: align indentation of company names`")
(this is going to be fun :-()

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index 9d1a48ba2445,9873ab7a0cf5..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -3,64 -3,63 +3,64 @@@ Device tree binding vendor prefix regis
  This isn't an exhaustive list, but you should add new prefixes to it before
  using them to avoid name-space collisions.
  
- abcn	Abracon Corporation
- abilis	Abilis Systems
- actions	Actions Semiconductor Co., Ltd.
+ abilis		Abilis Systems
+ abracon		Abracon Corporation
+ actions		Actions Semiconductor Co., Ltd.
  active-semi	Active-Semi International Inc
- ad	Avionic Design GmbH
+ ad		Avionic Design GmbH
  adapteva	Adapteva, Inc.
  adaptrum	Adaptrum, Inc.
- adh	AD Holdings Plc.
- adi	Analog Devices, Inc.
+ adh		AD Holdings Plc.
+ adi		Analog Devices, Inc.
  advantech	Advantech Corporation
  aeroflexgaisler	Aeroflex Gaisler AB
- al	Annapurna Labs
+ al		Annapurna Labs
  allwinner	Allwinner Technology Co., Ltd.
  alphascale	AlphaScale Integrated Circuits Systems, Inc.
- altr	Altera Corp.
- amarula	Amarula Solutions
- amazon	Amazon.com, Inc.
- amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
- amd	Advanced Micro Devices (AMD), Inc.
- amlogic	Amlogic, Inc.
- ampire	Ampire Co., Ltd.
- ams	AMS AG
- amstaos	AMS-Taos Inc.
+ altr		Altera Corp.
++amarula		Amarula Solutions
+ amazon		Amazon.com, Inc.
+ amcc		Applied Micro Circuits Corporation (APM, formally AMCC)
+ amd		Advanced Micro Devices (AMD), Inc.
+ amlogic		Amlogic, Inc.
+ ampire		Ampire Co., Ltd.
+ ams		AMS AG
+ amstaos		AMS-Taos Inc.
  analogix	Analogix Semiconductor, Inc.
  andestech	Andes Technology Corporation
- apm	Applied Micro Circuits Corporation (APM)
- aptina	Aptina Imaging
- arasan	Arasan Chip Systems
- arctic	Arctic Sand
- aries	Aries Embedded GmbH
- arm	ARM Ltd.
+ apm		Applied Micro Circuits Corporation (APM)
+ aptina		Aptina Imaging
+ arasan		Arasan Chip Systems
+ arctic		Arctic Sand
+ aries		Aries Embedded GmbH
+ arm		ARM Ltd.
  armadeus	ARMadeus Systems SARL
- arrow	Arrow Electronics
- artesyn	Artesyn Embedded Technologies Inc.
+ arrow		Arrow Electronics
+ artesyn		Artesyn Embedded Technologies Inc.
  asahi-kasei	Asahi Kasei Corp.
- aspeed	ASPEED Technology Inc.
- atlas	Atlas Scientific LLC
- atmel	Atmel Corporation
- auo	AU Optronics Corporation
- auvidea Auvidea GmbH
- avago	Avago Technologies
- avia	avia semiconductor
- avic	Shanghai AVIC Optoelectronics Co., Ltd.
- axentia	Axentia Technologies AB
- axis	Axis Communications AB
- bananapi BIPAI KEJI LIMITED
- bhf	Beckhoff Automation GmbH & Co. KG
- boe	BOE Technology Group Co., Ltd.
- bosch	Bosch Sensortec GmbH
+ aspeed		ASPEED Technology Inc.
+ atlas		Atlas Scientific LLC
+ atmel		Atmel Corporation
+ auo		AU Optronics Corporation
+ auvidea 	Auvidea GmbH
+ avago		Avago Technologies
+ avia		avia semiconductor
+ avic		Shanghai AVIC Optoelectronics Co., Ltd.
+ axentia		Axentia Technologies AB
+ axis		Axis Communications AB
+ bananapi	BIPAI KEJI LIMITED
+ bhf		Beckhoff Automation GmbH & Co. KG
+ boe		BOE Technology Group Co., Ltd.
+ bosch		Bosch Sensortec GmbH
  boundary	Boundary Devices Inc.
- brcm	Broadcom Corporation
- buffalo	Buffalo, Inc.
- calxeda	Calxeda
- capella	Capella Microsystems, Inc
- cascoda	Cascoda, Ltd.
- cavium	Cavium, Inc.
- cdns	Cadence Design Systems Inc.
- ceva	Ceva, Inc.
+ brcm		Broadcom Corporation
+ buffalo		Buffalo, Inc.
+ calxeda		Calxeda
+ capella		Capella Microsystems, Inc
+ cascoda		Cascoda, Ltd.
+ cavium		Cavium, Inc.
+ cdns		Cadence Design Systems Inc.
+ ceva		Ceva, Inc.
  chipidea	Chipidea, Inc
  chipone		ChipOne
  chipspark	ChipSPARK
@@@ -229,157 -228,156 +229,157 @@@ netgear		NETGEA
  netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
  netron-dy	Netron DY
  netxeon		Shenzhen Netxeon Technology CO., LTD
- nexbox	Nexbox
+ nexbox		Nexbox
  newhaven	Newhaven Display International
- ni	National Instruments
+ ni		National Instruments
  nintendo	Nintendo
- nlt	NLT Technologies, Ltd.
- nokia	Nokia
- nordic	Nordic Semiconductor
- nuvoton	Nuvoton Technology Corporation
- nvd	New Vision Display
- nvidia	NVIDIA
- nxp	NXP Semiconductors
- okaya	Okaya Electric America, Inc.
- oki	Oki Electric Industry Co., Ltd.
- olimex	OLIMEX Ltd.
- onion	Onion Corporation
- onnn	ON Semiconductor Corp.
- ontat	On Tat Industrial Company
+ nlt		NLT Technologies, Ltd.
+ nokia		Nokia
+ nordic		Nordic Semiconductor
+ nuvoton		Nuvoton Technology Corporation
+ nvd		New Vision Display
+ nvidia		NVIDIA
+ nxp		NXP Semiconductors
+ okaya		Okaya Electric America, Inc.
+ oki		Oki Electric Industry Co., Ltd.
+ olimex		OLIMEX Ltd.
+ onion		Onion Corporation
+ onnn		ON Semiconductor Corp.
+ ontat		On Tat Industrial Company
  opencores	OpenCores.org
- option	Option NV
- ORCL	Oracle Corporation
+ option		Option NV
+ ORCL		Oracle Corporation
  ortustech	Ortus Technology Co., Ltd.
- ovti	OmniVision Technologies
- oxsemi	Oxford Semiconductor, Ltd.
+ ovti		OmniVision Technologies
+ oxsemi		Oxford Semiconductor, Ltd.
  panasonic	Panasonic Corporation
- parade	Parade Technologies Inc.
- pericom	Pericom Technology Inc.
+ parade		Parade Technologies Inc.
+ pericom		Pericom Technology Inc.
  pervasive	Pervasive Displays, Inc.
- phytec	PHYTEC Messtechnik GmbH
+ phytec		PHYTEC Messtechnik GmbH
  picochip	Picochip Ltd
- pine64	Pine64
- pixcir  PIXCIR MICROELECTRONICS Co., Ltd
+ pine64		Pine64
+ pixcir  	PIXCIR MICROELECTRONICS Co., Ltd
  plathome	Plat'Home Co., Ltd.
- plda	PLDA
- poslab	Poslab Technology Co., Ltd.
- powervr	PowerVR (deprecated, use img)
+ plda		PLDA
+ poslab		Poslab Technology Co., Ltd.
+ powervr		PowerVR (deprecated, use img)
  pulsedlight	PulsedLight, Inc
- qca	Qualcomm Atheros, Inc.
- qcom	Qualcomm Technologies, Inc
- qemu	QEMU, a generic and open source machine emulator and virtualizer
- qi	Qi Hardware
+ qca		Qualcomm Atheros, Inc.
+ qcom		Qualcomm Technologies, Inc
+ qemu		QEMU, a generic and open source machine emulator and virtualizer
+ qi		Qi Hardware
  qiaodian	QiaoDian XianShi Corporation
- qnap	QNAP Systems, Inc.
- radxa	Radxa
+ qnap		QNAP Systems, Inc.
+ radxa		Radxa
  raidsonic	RaidSonic Technology GmbH
- ralink	Mediatek/Ralink Technology Corp.
- ramtron	Ramtron International
+ ralink		Mediatek/Ralink Technology Corp.
+ ramtron		Ramtron International
  raspberrypi	Raspberry Pi Foundation
- raydium	Raydium Semiconductor Corp.
- realtek Realtek Semiconductor Corp.
- renesas	Renesas Electronics Corporation
- richtek	Richtek Technology Corporation
- ricoh	Ricoh Co. Ltd.
+ raydium		Raydium Semiconductor Corp.
+ realtek 	Realtek Semiconductor Corp.
+ renesas		Renesas Electronics Corporation
+ richtek		Richtek Technology Corporation
+ ricoh		Ricoh Co. Ltd.
  rikomagic	Rikomagic Tech Corp. Ltd
- riscv	RISC-V Foundation
+ riscv		RISC-V Foundation
  rockchip	Fuzhou Rockchip Electronics Co., Ltd
- rohm	ROHM Semiconductor Co., Ltd
- roofull	Shenzhen Roofull Technology Co, Ltd
- samsung	Samsung Semiconductor
- samtec	Samtec/Softing company
- sandisk	Sandisk Corporation
- sbs	Smart Battery System
+ rohm		ROHM Semiconductor Co., Ltd
+ roofull		Shenzhen Roofull Technology Co, Ltd
+ samsung		Samsung Semiconductor
+ samtec		Samtec/Softing company
+ sandisk		Sandisk Corporation
+ sbs		Smart Battery System
  schindler	Schindler
- seagate	Seagate Technology PLC
- semtech	Semtech Corporation
+ seagate		Seagate Technology PLC
+ semtech		Semtech Corporation
  sensirion	Sensirion AG
- sff	Small Form Factor Committee
- sgx	SGX Sensortech
- sharp	Sharp Corporation
- si-en	Si-En Technology Ltd.
- sigma	Sigma Designs, Inc.
- sii	Seiko Instruments, Inc.
- sil	Silicon Image
- silabs	Silicon Laboratories
- silead	Silead Inc.
- silergy	Silergy Corp.
+ sff		Small Form Factor Committee
+ sgx		SGX Sensortech
+ sharp		Sharp Corporation
+ si-en		Si-En Technology Ltd.
+ sigma		Sigma Designs, Inc.
+ sii		Seiko Instruments, Inc.
+ sil		Silicon Image
+ silabs		Silicon Laboratories
+ silead		Silead Inc.
+ silergy		Silergy Corp.
  siliconmitus	Silicon Mitus, Inc.
  simtek
- sirf	SiRF Technology, Inc.
- sis	Silicon Integrated Systems Corp.
+ sirf		SiRF Technology, Inc.
+ sis		Silicon Integrated Systems Corp.
  sitronix	Sitronix Technology Corporation
  skyworks	Skyworks Solutions, Inc.
- smsc	Standard Microsystems Corporation
- snps	Synopsys, Inc.
+ smsc		Standard Microsystems Corporation
+ snps		Synopsys, Inc.
  socionext	Socionext Inc.
  solidrun	SolidRun
- solomon        Solomon Systech Limited
- sony	Sony Corporation
+ solomon		Solomon Systech Limited
+ sony		Sony Corporation
  spansion	Spansion Inc.
- sprd	Spreadtrum Communications Inc.
- st	STMicroelectronics
- starry	Starry Electronic Technology (ShenZhen) Co., LTD
- startek	Startek
- ste	ST-Ericsson
+ sprd		Spreadtrum Communications Inc.
+ st		STMicroelectronics
+ starry		Starry Electronic Technology (ShenZhen) Co., LTD
+ startek		Startek
+ ste		ST-Ericsson
  stericsson	ST-Ericsson
- summit	Summit microelectronics
- sunchip	Shenzhen Sunchip Technology Co., Ltd
- SUNW	Sun Microsystems, Inc
- swir	Sierra Wireless
- syna	Synaptics Inc.
+ summit		Summit microelectronics
+ sunchip		Shenzhen Sunchip Technology Co., Ltd
+ SUNW		Sun Microsystems, Inc
+ swir		Sierra Wireless
+ syna		Synaptics Inc.
  synology	Synology, Inc.
- tbs	TBS Technologies
+ tbs		TBS Technologies
 +tbs-biometrics	Touchless Biometric Systems AG
- tcg	Trusted Computing Group
- tcl	Toby Churchill Ltd.
+ tcg		Trusted Computing Group
+ tcl		Toby Churchill Ltd.
  technexion	TechNexion
  technologic	Technologic Systems
- terasic	Terasic Inc.
- thine	THine Electronics, Inc.
- ti	Texas Instruments
- tianma	Tianma Micro-electronics Co., Ltd.
- tlm	Trusted Logic Mobility
- topeet  Topeet
- toradex	Toradex AG
- toshiba	Toshiba Corporation
- toumaz	Toumaz
- tpk	TPK U.S.A. LLC
- tplink	TP-LINK Technologies Co., Ltd.
- tpo	TPO
- tronfy	Tronfy
+ terasic		Terasic Inc.
+ thine		THine Electronics, Inc.
+ ti		Texas Instruments
+ tianma		Tianma Micro-electronics Co., Ltd.
+ tlm		Trusted Logic Mobility
+ topeet  	Topeet
+ toradex		Toradex AG
+ toshiba		Toshiba Corporation
+ toumaz		Toumaz
+ tpk		TPK U.S.A. LLC
+ tplink		TP-LINK Technologies Co., Ltd.
+ tpo		TPO
+ tronfy		Tronfy
  tronsmart	Tronsmart
- truly	Truly Semiconductors Limited
- tsd	Theobroma Systems Design und Consulting GmbH
- tyan	Tyan Computer Corporation
+ truly		Truly Semiconductors Limited
+ tsd		Theobroma Systems Design und Consulting GmbH
+ tyan		Tyan Computer Corporation
  ucrobotics	uCRobotics
- udoo	Udoo
- uniwest	United Western Technologies Corp (UniWest)
- upisemi	uPI Semiconductor Corp.
- urt	United Radiant Technology Corporation
- usi	Universal Scientific Industrial Co., Ltd.
- v3	V3 Semiconductor
+ udoo		Udoo
+ uniwest		United Western Technologies Corp (UniWest)
+ upisemi		uPI Semiconductor Corp.
+ urt		United Radiant Technology Corporation
+ usi		Universal Scientific Industrial Co., Ltd.
+ v3		V3 Semiconductor
  variscite	Variscite Ltd.
- via	VIA Technologies, Inc.
- virtio	Virtual I/O Device Specification, developed by the OASIS consortium
- vivante	Vivante Corporation
- vocore VoCore Studio
- voipac	Voipac Technologies s.r.o.
- wd	Western Digital Corp.
- wetek	WeTek Electronics, limited.
- wexler	Wexler
- winbond Winbond Electronics corp.
- winstar	Winstar Display Corp.
- wlf	Wolfson Microelectronics
- wm	Wondermedia Technologies, Inc.
+ via		VIA Technologies, Inc.
+ virtio		Virtual I/O Device Specification, developed by the OASIS consortium
+ vivante		Vivante Corporation
+ vocore		VoCore Studio
+ voipac		Voipac Technologies s.r.o.
+ wd		Western Digital Corp.
+ wetek		WeTek Electronics, limited.
+ wexler		Wexler
+ winbond 	Winbond Electronics corp.
+ winstar		Winstar Display Corp.
+ wlf		Wolfson Microelectronics
+ wm		Wondermedia Technologies, Inc.
  x-powers	X-Powers
- xes	Extreme Engineering Solutions (X-ES)
+ xes		Extreme Engineering Solutions (X-ES)
  xillybus	Xillybus Ltd.
- xlnx	Xilinx
- xunlong	Shenzhen Xunlong Software CO.,Limited
- zarlink	Zarlink Semiconductor
- zeitec	ZEITEC Semiconductor Co., LTD.
- zidoo	Shenzhen Zidoo Technology Co., Ltd.
- zii	Zodiac Inflight Innovations
- zte	ZTE Corp.
- zyxel	ZyXEL Communications Corp.
+ xlnx		Xilinx
+ xunlong		Shenzhen Xunlong Software CO.,Limited
+ zarlink		Zarlink Semiconductor
+ zeitec		ZEITEC Semiconductor Co., LTD.
+ zidoo		Shenzhen Zidoo Technology Co., Ltd.
+ zii		Zodiac Inflight Innovations
+ zte		ZTE Corp.
+ zyxel		ZyXEL Communications Corp.
