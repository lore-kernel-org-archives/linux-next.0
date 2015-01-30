From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] arm: reduce conflicts in Kcinfig.debug
Date: Fri, 30 Jan 2015 07:02:51 +0200
Message-ID: <20150130050251.GN19448@tarshish>
References: <20150130130117.4d9fbd70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:57557 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750787AbbA3FDF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Jan 2015 00:03:05 -0500
Content-Disposition: inline
In-Reply-To: <20150130130117.4d9fbd70@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Fri, Jan 30, 2015 at 01:01:17PM +1100, Stephen Rothwell wrote:
> I have seen several conflicts in this file (and other Kconfig files)
> over time, so I suggest a solution like below.
> 
> Create new config symbols that can be selected by other configs
> and use them as single dependencies rather than having long lists of
> other config symbols as dependencies.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

For subject: s/Kcinfig/Kconfig/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
