From: Andy Gross <andy.gross@linaro.org>
Subject: Re: linux-next: manual merge of the regulator tree with the qcom tree
Date: Thu, 17 Dec 2015 11:58:22 -0600
Message-ID: <20151217175822.GA3835@Agamemnon.attlocal.net>
References: <20151217130129.7ba3b7ae@canb.auug.org.au>
 <20151217112201.GR5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:36837 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809AbbLQR6Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2015 12:58:24 -0500
Received: by mail-yk0-f173.google.com with SMTP id x184so28452166yka.3
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2015 09:58:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151217112201.GR5727@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <agross@codeaurora.org>

On Thu, Dec 17, 2015 at 11:22:01AM +0000, Mark Brown wrote:
> On Thu, Dec 17, 2015 at 01:01:29PM +1100, Stephen Rothwell wrote:
> 
> > between commit:
> 
> >   f6251e80956d ("soc: qcom: documentation: Update SMD/RPM Docs")
> >   9ee8373a1552 ("soc: qcom: smd-rpm: Add existing platform support")
> 
> > from the qcom tree and commit:
> 
> >   7a400585893e ("soc: qcom: documentation: Update SMD/RPM Docs")
> 
> > from the regulator tree.
> 
> > I fixed it up (I used the qcom tree version - please sort out the
> > mess).
> 
> Andy, what's going on here?

I hadn't reformulated my next branch before Stephen pulled again.  My
mistake and it was fixed last night, but not in time.
