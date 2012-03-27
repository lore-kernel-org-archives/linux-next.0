From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the input tree with Linus' tree
Date: Tue, 27 Mar 2012 00:33:58 -0700
Message-ID: <20120327073358.GD1521@core.coreip.homeip.net>
References: <20120327121610.e39e648811d5b00ae328077b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:59791 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752999Ab2C0HeG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Mar 2012 03:34:06 -0400
Content-Disposition: inline
In-Reply-To: <20120327121610.e39e648811d5b00ae328077b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Gerecke <killertofu@gmail.com>, Chris Bagwell <chris@cnpbagwell.com>

Hi Stephen,

On Tue, Mar 27, 2012 at 12:16:10PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next merge of the input tree got a conflict in
> drivers/input/tablet/wacom_sys.c between commit 24e3e5ae1e4c ("Input:
> wacom - fix physical size calculation for 3rd-gen Bamboo") from Linus'
> tree and commit 16bf288c4be6 ("Input: wacom - create inputs when wireless
> connect") from the input tree.
> 
> The latter seems to incorporate the former, so I used that.

Thank you. I merged the branches and resolved conflict so you should not
see it anymore.

Thanks.

-- 
Dmitry
