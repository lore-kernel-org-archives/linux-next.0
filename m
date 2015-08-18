From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 18 (drivers/media/i2c/tc358743.c)
Date: Tue, 18 Aug 2015 08:26:29 -0700
Message-ID: <55D34EA5.1010705@infradead.org>
References: <20150818214003.73bd846a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:44715 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbbHRP0h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2015 11:26:37 -0400
In-Reply-To: <20150818214003.73bd846a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, Ramakrishnan Muthukrishnan <ram@rkrishnan.org>, Mikhail Khelik <mkhelik@cisco.com>, Mats Randgaard <matrandg@cisco.com>

On 08/18/15 04:40, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150817:
> 

on i386:

when CONFIG_MEDIA_CONTROLLER is not enabled:

../drivers/media/i2c/tc358743.c: In function 'tc358743_probe':
../drivers/media/i2c/tc358743.c:1890:29: error: 'struct v4l2_subdev' has no member named 'entity'
  err = media_entity_init(&sd->entity, 1, &state->pad, 0);
                             ^
../drivers/media/i2c/tc358743.c:1940:26: error: 'struct v4l2_subdev' has no member named 'entity'
  media_entity_cleanup(&sd->entity);
                          ^
../drivers/media/i2c/tc358743.c: In function 'tc358743_remove':
../drivers/media/i2c/tc358743.c:1955:26: error: 'struct v4l2_subdev' has no member named 'entity'
  media_entity_cleanup(&sd->entity);
                          ^



-- 
~Randy
