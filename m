From: Sujith <Sujith.Manoharan@atheros.com>
Subject: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Wed, 24 Mar 2010 13:43:51 +0530
Message-ID: <19369.51647.544760.353002@gargle.gargle.HOWL>
References: <20100324155930.1fa3367b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.36.123.2]:45664 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753224Ab0CXHxy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Mar 2010 03:53:54 -0400
In-Reply-To: <20100324155930.1fa3367b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vasanth Thiagarajan <Vasanth.Thiagarajan@Atheros.com>, Senthilkumar Balasubramanian <Senthilkumar.Balasubramanian@Atheros.com>

Stephen Rothwell wrote:
> Hi John,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 

Thanks for reporting this.
A patch has been sent to fix this issue: https://patchwork.kernel.org/patch/87829/

Sujith
