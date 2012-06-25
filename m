From: viresh kumar <viresh.kumar2@arm.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 25 Jun 2012 09:06:59 +0100
Message-ID: <4FE81C23.30203@arm.com>
References: <20120625141140.c6d71065dab293005514ee1a@canb.auug.org.au> <4FE8009A.4020503@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service88.mimecast.com ([195.130.217.12]:46140 "EHLO
	service88.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833Ab2FYIHG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jun 2012 04:07:06 -0400
In-Reply-To: <4FE8009A.4020503@st.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rajeev kumar <rajeev-dlh.kumar@st.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 25/06/12 07:09, Rajeev kumar wrote:
> 1. Protecting clk_get/clk_put* calls under macro 'CONFIG_HAVE_CLK' in
> the driver.

Not at all now.

> 2. Adding a check in Kconfig for HAVE_CLK.
> (But that will limit the compilation of this driver for only platforms
> which are ARM based/or similar).

Not actually required

> 3. We can pick the patches circulated by Viresh Kumar where we don't
> have HAVE_CLK defined for x86_64, then the inline routines like
> following should come into play:

That's the best. But probably Mark need to pull in AKPM's tree first into
sound-asoc tree. Mark?

--
Viresh

-- IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.  Thank you.
