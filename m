From: "Steve French" <smfrench@gmail.com>
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 12:58:42 -0600
Message-ID: <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com>
References: <20090112154539.4857f533.sfr@canb.auug.org.au>
	 <496B899E.7060605@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f17.google.com ([209.85.219.17]:54772 "EHLO
	mail-ew0-f17.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbZALS6q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 13:58:46 -0500
In-Reply-To: <496B899E.7060605@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org, Greg KH <gregkh@suse.de>

There is not just the cifs md5 one (which has been around a long
time), but an md5_init (static) in crypto and the new one in rt.  The
addition of the new one (rt md5_init) causes the build problem.   It
would be nice if we could use the same md5 routines though ... last
time we checked the crypto one was not well suited for calculating
signatures as a network fs would do though.

On Mon, Jan 12, 2009 at 12:19 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> Stephen Rothwell wrote:
>> Hi all,
>>
>> Some people took me at my word and so we have the 2.6.30 code starting to
>> trickle in already.
>
>
>
> When CIFS is built-in (=y) and staging/rt28[67]0 =y, there are multiple
> definitions of:
>
> build-r8250.out:(.text+0x1d8ad0): multiple definition of `MD5Init'
> build-r8250.out:(.text+0x1dbb30): multiple definition of `MD5Update'
> build-r8250.out:(.text+0x1db9b0): multiple definition of `MD5Final'
>
> all of which need to have more unique identifiers for their global
> symbols (e.g., rt28_md5_init, cifs_md5_init, foo, blah, bar).
>
>
> --
> ~Randy
>



-- 
Thanks,

Steve
