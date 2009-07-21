From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/16] drbd: a block device for HA clusters
Date: Mon, 20 Jul 2009 22:49:40 -0700
Message-ID: <20090720224940.36da1ef8.akpm@linux-foundation.org>
References: <1246894775-10855-1-git-send-email-philipp.reisner@linbit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754483AbZGUFvP@vger.kernel.org>
In-Reply-To: <1246894775-10855-1-git-send-email-philipp.reisner@linbit.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>, Greg KH <gregkh@suse.de>, Neil Brown <neilb@suse.de>, James Bottomley <James.Bottomley@HansenPartnership.com>, Sam Ravnborg <sam@ravnborg.org>, Dave Jones <davej@redhat.com>, Nikanth Karthikesan <knikanth@suse.de>, Lars Marowsky-Bree <lmb@suse.de>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Kyle Moffett <kyle@moffetthome.net>, Bart Van Assche <bart.vanassche@gmail.com>, Christoph Hellwig <hch@infradead.org>, drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon,  6 Jul 2009 17:39:19 +0200 Philipp Reisner <philipp.reisner@linbit.com> wrote:

> As the first bit of the DBRD patch already got upstream (see commit
> 10fc89d01a) it is time to get more of DRBD towards mainline.
> 
> Here is a post of drbd-8.3.2 for inclusion into linux-mm (or linux-next).
> 
> Patch set attached. Git tree available:
> git pull git://git.drbd.org/linux-2.6-drbd.git drbd

I don't think I can be bothered reading all this again ;)  I trust that
earlier review comments were suitably addressed.

Please prepare a tree for inclusion in linux-next, send that off to
Stephen and unless someone can identify reasons otherwise, send Linus a pull
request for 2.6.32-rc1.
