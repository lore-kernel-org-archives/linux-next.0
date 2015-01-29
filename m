From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Thu, 29 Jan 2015 23:05:35 +0000
Message-ID: <20150129230535.GG26493@n2100.arm.linux.org.uk>
References: <20150130095533.315d3831@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:35269 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbbA2XFw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Jan 2015 18:05:52 -0500
Content-Disposition: inline
In-Reply-To: <20150130095533.315d3831@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Guo Zeng <Guo.Zeng@csr.com>, Barry Song <Baohua.Song@csr.com>, Baruch Siach <baruch@tkos.co.il>

On Fri, Jan 30, 2015 at 09:55:33AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/Kconfig.debug between commit 4d31e6641295 ("ARM: 8272/1: netx:
> Migrate DEBUG_LL macros to shared directory") from the  tree and
> commits 01ea63d99397 ("ARM: sirf: add two debug ports for CSRatlas7
> SoC") and e23814da8262 ("ARM: digicolor: add low level debug support")
> from the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Both of these conflict resolutions (the other one you sent after this)
look reasonable, thanks Stephen.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
