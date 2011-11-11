From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the input tree with the s5p tree
Date: Thu, 10 Nov 2011 19:42:28 -0800
Message-ID: <201111101942.28673.dmitry.torokhov@gmail.com>
References: <20111111131147.3f7ab8c9f14a7d87cc83b5ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:42441 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782Ab1KKDmt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2011 22:42:49 -0500
In-Reply-To: <20111111131147.3f7ab8c9f14a7d87cc83b5ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

On Thursday, November 10, 2011 06:11:47 PM Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next merge of the input tree got a conflict in
> drivers/input/keyboard/samsung-keypad.c between commit 532f74540134
> ("input: samsung-keypad: Add device tree support") from the s5p tree and
> commit 400bf2995be6 ("Input: samsung-keypad - switch to using
> SIMPLE_DEV_PM_OPS") from the input tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.


Yep, looks good, thanks Stephen.

-- 
Dmitry
