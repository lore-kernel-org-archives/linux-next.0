From: Steve French <smfrench@austin.rr.com>
Subject: Re: linux-next: cifs tree build failure
Date: Thu, 02 Apr 2009 22:31:32 -0500
Message-ID: <49D58314.5090306@austin.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:61400 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751893AbZDCDaF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2009 23:30:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: niallain@gmail.com, Jeff Layton <jlayton@redhat.com>, linux-next@vger.kernel.org, sfr@canb.auug.org.au, linux-cifs-client@lists.samba.org

I added an ifdef to fs/cifs/connect.c which should address this.
