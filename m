From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next-0409: kvm-ia64 build failure when !MODULES
Date: Thu, 9 Apr 2009 17:05:10 +0400
Message-ID: <a4423d670904090605w2f26970o37b2493e9bbf2630@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:56344 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933759AbZDINFM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 09:05:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "kvm-ia64@vger.kernel.org" <kvm-ia64@vger.kernel.org>

Hi

arch/ia64/kvm/kvm-ia64.c: In function 'kvm_patch_vmm':
arch/ia64/kvm/kvm-ia64.c:1686: error: dereferencing pointer to incomplete type
arch/ia64/kvm/kvm-ia64.c: In function 'kvm_relocate_vmm':
arch/ia64/kvm/kvm-ia64.c:1718: error: dereferencing pointer to incomplete type
arch/ia64/kvm/kvm-ia64.c:1719: error: dereferencing pointer to incomplete type

# CONFIG_MODULES is not set
