From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: pcmcia tree build failure
Date: Fri, 29 Aug 2008 09:44:17 +0200
Message-ID: <20080829074417.GA26747@isilmar.linta.de>
References: <20080829163658.c8ea1bba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:46457 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750799AbYH2HoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 03:44:19 -0400
Content-Disposition: inline
In-Reply-To: <20080829163658.c8ea1bba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Aug 29, 2008 at 04:36:58PM +1000, Stephen Rothwell wrote:
> Caused by commit 86b736d122166ec779bd86ac24e24117a675e98d ("pcmcia:
> cleanup device driver header file") which removed the handle_to_dev()
> macro.  I applied the following patch.

ooops. Fixed. Thanks. Also fixed another build failure, so if you can
re-load the pcmcia tree, that'd be great.

Best,
	Dominik
