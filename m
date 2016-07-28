From: Joe Perches <joe@perches.com>
Subject: Re: [BUG -next] "random: make /dev/urandom scalable for silly
 userspace programs" causes crash
Date: Thu, 28 Jul 2016 11:12:09 -0700
Message-ID: <1469729529.3998.59.camel@perches.com>
References: <20160727071400.GA3912@osiris>
	 <20160728034601.GC20032@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20160728034601.GC20032@thunk.org>
Sender: owner-linux-mm@kvack.org
To: Theodore Ts'o <tytso@mit.edu>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2016-07-27 at 23:46 -0400, Theodore Ts'o wrote:
> On Wed, Jul 27, 2016 at 09:14:00AM +0200, Heiko Carstens wrote:
> >=20
> > it looks like your patch "random: make /dev/urandom scalable for sill=
y
> > userspace programs" within linux-next seems to be a bit broken:
> >=20
> > It causes this allocation failure and subsequent crash on s390 with f=
ake
> > NUMA enabled
> Thanks for reporting this.=A0=A0This patch fixes things for you, yes?

trivia:

> diff --git a/drivers/char/random.c b/drivers/char/random.c
[]
> @@ -1668,13 +1668,12 @@ static int rand_initialize(void)
> =A0#ifdef CONFIG_NUMA
> =A0	pool =3D kmalloc(num_nodes * sizeof(void *),
> =A0		=A0=A0=A0=A0=A0=A0=A0GFP_KERNEL|__GFP_NOFAIL|__GFP_ZERO);

The __GFP_ZERO is unusual and this could use kcalloc instead.

> -	for (i=3D0; i < num_nodes; i++) {
> +	for_each_online_node(i) {
> =A0		crng =3D kmalloc_node(sizeof(struct crng_state),
> =A0				=A0=A0=A0=A0GFP_KERNEL | __GFP_NOFAIL, i);
> =A0		spin_lock_init(&crng->lock);
> =A0		crng_initialize(crng);
> =A0		pool[i] =3D crng;
> -
> =A0	}
> =A0	mb();
> =A0	crng_node_pool =3D pool;

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
