From: Mark Salter <msalter@redhat.com>
Subject: getting fixmap patches in linux-next
Date: Wed, 11 Dec 2013 10:25:05 -0500
Message-ID: <1386775505.1979.105.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60962 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707Ab3LKPZK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Dec 2013 10:25:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, mingo <mingo@redhat.com>

Hi, I have cleanup of fixmap.h here:

 http://lkml.org/lkml/2013/11/25/474

Most of the series has been ack'd with the notable exception
of the arch/x86 part. I'd like to get this series into linux-next
but I'm not sure of the best way. I could put it in the c6x tree
but it doesn't belong there and I don't want to put the x86 patch
in there without any acks. I've cc'd Ingo thinking the tip tree
may be the place it should go.

--Mark
