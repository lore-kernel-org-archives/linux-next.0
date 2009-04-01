From: Gabriel C <nix.or.die@googlemail.com>
Subject: Re: Invalid module format (was: Re: linux-next: Tree for April 1)
Date: Wed, 1 Apr 2009 17:52:59 +0200
Message-ID: <1820d69d0904010852qc07ccc7qc9cec18bcc2837bd@mail.gmail.com>
References: <20090401164450.f8192631.sfr@canb.auug.org.au>
	 <20090401150928.GA5886@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.186]:44421 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbZDAPxC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2009 11:53:02 -0400
In-Reply-To: <20090401150928.GA5886@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2009/4/1 Nico -telmich- Schottelius <nico-linux-next@schottelius.org>:
> Stephen Rothwell [Wed, Apr 01, 2009 at 04:44:50PM +1100]:
>> Hi all,
>>
>> Changes since 20090331:
>
> Same problem since 20090324.

AFAIK it is since 20090218...

>
> arch=amd64, config attached, all modules have that problem.

Disabling CONFIG_MODVERSIONS should workaround this problem.

>
> Sincerly,
>
> Nico

Gabriel
