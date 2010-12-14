From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the input tree with Linus' tree
Date: Tue, 14 Dec 2010 10:40:00 -0800
Message-ID: <20101214184000.GA11384@core.coreip.homeip.net>
References: <20101214132658.ce0f5bc6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43052 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758281Ab0LNSkI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2010 13:40:08 -0500
Content-Disposition: inline
In-Reply-To: <20101214132658.ce0f5bc6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 14, 2010 at 01:26:58PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next merge of the input tree got a conflict in
> include/linux/input.h between commit
> 86b17f76f462db460d6d916e105a4c44cb353e36 ("Input: document struct
> input_absinfo") from Linus' tree and commit
> a528f721b7c0ba70433dbddf5947eea458c3e36a ("Input: document new trkid
> field in struct input_dev") from the input tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Hi Stephen,

The fix looks good and if you could carry it for a while that would be
great - I try to avoid cross-merging branches if possible...

Thanks.

-- 
Dmitry
