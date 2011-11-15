From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the input tree with the s5p tree
Date: Tue, 15 Nov 2011 16:26:21 +0900
Message-ID: <004501cca367$dfbbd650$9f3382f0$%kim@samsung.com>
References: <20111111131159.848e724c5a9257d0b9f0f0f9@canb.auug.org.au>
 <201111101941.59570.dmitry.torokhov@gmail.com>
 <20111111165741.5a6d5f14ad70f98776d3b39a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16643 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753218Ab1KOH0X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Nov 2011 02:26:23 -0500
In-reply-to: <20111111165741.5a6d5f14ad70f98776d3b39a@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Stephen Rothwell wrote:
> 
> Hi Dmitry,
> 
> On Thu, 10 Nov 2011 19:41:59 -0800 Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Please drop the whole HAVE_SAMSUNG_KEYPAD thing; HAVE_CLK is all
> > this driver needs. Expanding beyond Samsung will allow greater
> > compile coverage.
> 
> OK, I have modified the conflict resolution for tomorrow.
> 
OK, I will git-revert it in my tree.

Sorry for late response.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
