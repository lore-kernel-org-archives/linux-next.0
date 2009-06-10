From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next: CNIC: build fails
Date: Wed, 10 Jun 2009 16:56:57 +0400
Message-ID: <a4423d670906100556t6b193f45l1500f8f7c5cfe80b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:48119 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbZFJM45 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2009 08:56:57 -0400
Received: by fxm9 with SMTP id 9so735470fxm.37
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2009 05:56:58 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, mchan@broadcom.com, James.Bottomley@HansenPartnership.com

Hi

drivers/net/cnic.c: In function 'cnic_start_hw':
drivers/net/cnic.c:2391: error: implicit declaration of function 'pci_dev_get'

The problem is that kconfig selects CNIC without it dependencies

config SCSI_BNX2_ISCSI
        tristate "Broadcom NetXtreme II iSCSI support"
        select SCSI_ISCSI_ATTRS
        select CNIC

config BNX2
        tristate "Broadcom NetXtremeII support"
        depends on PCI
        select CRC32
        select FW_LOADER

config CNIC
        tristate "Broadcom CNIC support"
        depends on BNX2
        depends on UIO

$ egrep "CNIC|BNX|_PCI" .config
# CONFIG_PCI is not set
CONFIG_SCSI_BNX2_ISCSI=y
CONFIG_CNIC=y
