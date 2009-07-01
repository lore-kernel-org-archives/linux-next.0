From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Wed, 1 Jul 2009 16:07:45 +0400
Message-ID: <a4423d670907010507g5c1d205epd8383319f9db6aa@mail.gmail.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
	 <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f225.google.com ([209.85.218.225]:49787 "EHLO
	mail-bw0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbZGAMHn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2009 08:07:43 -0400
Received: by bwz25 with SMTP id 25so464864bwz.37
        for <linux-next@vger.kernel.org>; Wed, 01 Jul 2009 05:07:45 -0700 (PDT)
In-Reply-To: <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>

Hi Eric

Another problem today (0701)

kernel/auditfilter.c: In function 'audit_data_to_entry':
kernel/auditfilter.c:501: error: expected expression before '{' token
kernel/auditfilter.c: In function 'audit_add_rule':
kernel/auditfilter.c:891: error: expected expression before '{' token

CONFIG_AUDIT_WATCH is not set
