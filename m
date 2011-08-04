From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [PATCH -next] efivars: fix build warning when PSTORE is not
 enabled
Date: Thu, 4 Aug 2011 09:43:38 -0700
Message-ID: <987664A83D2D224EAE907B061CE93D5301EA1F3BC9@orsmsx505.amr.corp.intel.com>
References: <20110803151651.687fc6f377e255eccf58301b@canb.auug.org.au>
	<20110803104030.3c6443ab.rdunlap@xenotime.net>
	<20110804104927.be96accd4f255d2537d7372a@canb.auug.org.au>
 <20110803181524.6b7062d1.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:9075 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752829Ab1HDQnl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2011 12:43:41 -0400
In-Reply-To: <20110803181524.6b7062d1.rdunlap@xenotime.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>

-static u64 efi_pstore_write(enum pstore_type_id type, int part, size_t size,
-			    struct pstore_info *psi)
+static u64 efi_pstore_write(enum pstore_type_id type, unsigned int part,
+			    size_t size, struct pstore_info *psi)

Good ... but too late - I'd already fixed it and sent a "please pull" to
Linus a few hours earlier. Fix is in Linus' tree as b728a5c806

-Tony
