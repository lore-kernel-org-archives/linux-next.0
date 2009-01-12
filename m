From: "Steve French" <smfrench@gmail.com>
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 15:07:48 -0600
Message-ID: <524f69650901121307v67047946yed2c56efaaa839a1@mail.gmail.com>
References: <20090112154539.4857f533.sfr@canb.auug.org.au>
	 <496B899E.7060605@oracle.com>
	 <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com>
	 <20090112191330.GC7111@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f17.google.com ([209.85.219.17]:60002 "EHLO
	mail-ew0-f17.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752332AbZALVHu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 16:07:50 -0500
In-Reply-To: <20090112191330.GC7111@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org

On Mon, Jan 12, 2009 at 1:13 PM, Greg KH <gregkh@suse.de> wrote:
> On Mon, Jan 12, 2009 at 12:58:42PM -0600, Steve French wrote:
>> There is not just the cifs md5 one (which has been around a long
>> time), but an md5_init (static) in crypto and the new one in rt.  The
>> addition of the new one (rt md5_init) causes the build problem.   It
>> would be nice if we could use the same md5 routines though ... last
>> time we checked the crypto one was not well suited for calculating
>> signatures as a network fs would do though.
>
> I'll fix up the staging rt drivers to not do this, but cifs shouldn't be
> declaring such functions as globals either :)

I have changed the names of cifs's md5 functions in the cifs-2.6.git tree

diff --git a/fs/cifs/md5.h b/fs/cifs/md5.h
index f7d4f41..6fba8cb 100644
--- a/fs/cifs/md5.h
+++ b/fs/cifs/md5.h
@@ -20,10 +20,10 @@ struct HMACMD5Context {
 };
 #endif				/* _HMAC_MD5_H */

-void MD5Init(struct MD5Context *context);
-void MD5Update(struct MD5Context *context, unsigned char const *buf,
+void cifs_MD5_init(struct MD5Context *context);
+void cifs_MD5_update(struct MD5Context *context, unsigned char const *buf,
 			unsigned len);
-void MD5Final(unsigned char digest[16], struct MD5Context *context);
+void cifs_MD5_final(unsigned char digest[16], struct MD5Context *context);




-- 
Thanks,

Steve
