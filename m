From: Eric Paris <eparis@redhat.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Wed, 01 Jul 2009 08:38:50 -0400
Message-ID: <1246451930.22562.39.camel@dhcp235-23.rdu.redhat.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
	 <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
	 <a4423d670907010507g5c1d205epd8383319f9db6aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60380 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751420AbZGAMiu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jul 2009 08:38:50 -0400
In-Reply-To: <a4423d670907010507g5c1d205epd8383319f9db6aa@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>

On Wed, 2009-07-01 at 16:07 +0400, Alexander Beregalov wrote:
> Hi Eric
> 
> Another problem today (0701)
> 
> kernel/auditfilter.c: In function 'audit_data_to_entry':
> kernel/auditfilter.c:501: error: expected expression before '{' token
> kernel/auditfilter.c: In function 'audit_add_rule':
> kernel/auditfilter.c:891: error: expected expression before '{' token
> 
> CONFIG_AUDIT_WATCH is not set

This one is just me being stupid and committing the wrong version to the
tree :(   Thank you so much for testing this!

s/{ -EINVAL }/-EINVAL/

-Eric
