From: Lars Ellenberg <lars.ellenberg-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/16] drbd: a block device for HA clusters
Date: Tue, 21 Jul 2009 20:51:56 +0200
Message-ID: <20090721185156.GA10126@johann>
References: <1246894775-10855-1-git-send-email-philipp.reisner@linbit.com>
	<20090720224940.36da1ef8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090720224940.36da1ef8.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kyle Moffett <kyle-hoO6YkzgTuCM0SS3m2neIg@public.gmane.org>, Neil Brown <neilb-l3A5Bk7waGM@public.gmane.org>, Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bart Van Assche <bart.vanassche-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Marowsky-Bree <lmb-l3A5Bk7waGM@public.gmane.org>, Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Dave Jones <davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, James Bottomley <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 20, 2009 at 10:49:40PM -0700, Andrew Morton wrote:
> On Mon,  6 Jul 2009 17:39:19 +0200 Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org> wrote:
> > Patch set attached. Git tree available:
> > git pull git://git.drbd.org/linux-2.6-drbd.git drbd
> 
> I don't think I can be bothered reading all this again ;)  I trust that
> earlier review comments were suitably addressed.

To the best of my knowledge, we addressed all of them, yes.

> Please prepare a tree for inclusion in linux-next,
> send that off to Stephen

Ok, will do.
Stephen: expect an explicit linux-next merge request
within the next few days.

> and unless someone can identify reasons otherwise,
> send Linus a pull request for 2.6.32-rc1.

Thanks very much,

	Lars
