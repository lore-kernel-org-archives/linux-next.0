From: Lars Ellenberg <lars.ellenberg-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for Feb 23 (drbd)
Date: Fri, 1 Mar 2013 13:34:16 +0100
Message-ID: <20130301123416.GO2696@soda.linbit>
References: <20130225160038.d7f80aca93b62bd818c6b650@canb.auug.org.au>
	<512BBB43.8060309@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <512BBB43.8060309-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, Feb 25, 2013 at 11:28:03AM -0800, Randy Dunlap wrote:
> On 02/24/13 21:00, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any work destined for v3.10 to your -next included
> > branches until after Linus has release v3.9-rc1.
> > 
> > Changes since 20130222:
> > 
> 
> 
> on i386:
> 
>   CC [M]  drivers/block/drbd/drbd_receiver.o
> drivers/block/drbd/drbd_receiver.c: In function 'drbd_do_auth':
> drivers/block/drbd/drbd_receiver.c:4662:10: error: 'mdev' undeclared (first use in this function)
> make[4]: *** [drivers/block/drbd/drbd_receiver.o] Error 1
> 
> 
> Full randconfig file is attached.

see: https://lkml.org/lkml/2013/2/5/375
and:
http://git.drbd.org/gitweb.cgi?p=linux-drbd.git;a=commitdiff;h=23c275cba16615ac8cd3815cb1a86fd64cf12aa6

> # CONFIG_CRYPTO_HMAC is not set

	Lars
