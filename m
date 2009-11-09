From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: pcmcia tree build warning
Date: Mon, 9 Nov 2009 08:32:23 +0100
Message-ID: <20091109073223.GB20696@isilmar.linta.de>
References: <20091109145451.c9f1c4c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:36960 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752764AbZKIHcS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2009 02:32:18 -0500
Content-Disposition: inline
In-Reply-To: <20091109145451.c9f1c4c3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

this issue just got fixed by hiding it behind the driver-specific
DEBUG define -- thanks! :)

Best,
	Dominik
