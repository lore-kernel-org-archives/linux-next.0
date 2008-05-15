From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: i2c build failure
Date: Thu, 15 May 2008 14:47:58 -0500
Message-ID: <20080515194758.GA12267@lixom.net>
References: <20080515121241.1ede11be.sfr@canb.auug.org.au> <20080515102215.62378c4f@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lixom.net ([66.141.50.11]:58102 "EHLO mail.lixom.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751300AbYEOTb7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 15:31:59 -0400
Content-Disposition: inline
In-Reply-To: <20080515102215.62378c4f@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Hi,

On Thu, May 15, 2008 at 10:22:15AM +0200, Jean Delvare wrote:

> Thanks for the notification and sorry for the trouble. I thought that I
> knew about all users of struct i2c_board_info and that they were all
> converted by now but obviously not. I didn't know that fsl_soc.c had
> been partly forked for the pasemi platform.

Yeah, I did that because the "real" solution wasn't going to be ready
for .25 and I needed my boards to work. I saw no need in abstracting
it out and sharing code when it was something so simple that was just
going to go away soon anyway...

> Olof, please test it if you can. I will push this patch to Linux
> quickly.

Seems to work ok here.

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
