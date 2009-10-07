From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next-1007: dmar fails to build
Date: Wed, 7 Oct 2009 12:50:39 +0400
Message-ID: <a4423d670910070150v6b8df19bt733eac1b32f04257@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f217.google.com ([209.85.219.217]:62672 "EHLO
	mail-ew0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933205AbZJGIvQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2009 04:51:16 -0400
Received: by ewy17 with SMTP id 17so349784ewy.39
        for <linux-next@vger.kernel.org>; Wed, 07 Oct 2009 01:50:39 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Suresh Siddha <suresh.b.siddha@intel.com>, David Woodhouse <David.Woodhouse@intel.com>

drivers/pci/dmar.c: In function 'dmar_parse_one_rhsa':
drivers/pci/dmar.c:360: error: implicit declaration of function
'acpi_map_pxm_to_node'

$ grep NUMA .config
$
