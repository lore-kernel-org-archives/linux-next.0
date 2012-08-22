From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Wed, 22 Aug 2012 14:27:35 +1000
Message-ID: <20120822142735.5366c9abdee5274329e65fe3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__22_Aug_2012_14_27_35_+1000_dB4Xpgs2.tV0oX5a"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__22_Aug_2012_14_27_35_+1000_dB4Xpgs2.tV0oX5a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in
kernel/rcutree.h between commit 62ab7072476a ("rcu: Use
smp_hotplug_thread facility for RCUs per-CPU kthread") from the tip tree
and commit daa5d37ff51b ("rcu: Prevent force_quiescent_state() memory
contention") from the rcu tree.

Just context changes (I think).  I fixed it up (see below) and can carry
the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/rcutree.h
index 1224d4c,c2a3e7d..0000000
--- a/kernel/rcutree.h
+++ b/kernel/rcutree.h
@@@ -196,6 -200,13 +200,7 @@@ struct rcu_node=20
  				/* Refused to boost: not sure why, though. */
  				/*  This can happen due to race conditions. */
  #endif /* #ifdef CONFIG_RCU_BOOST */
 -	struct task_struct *node_kthread_task;
 -				/* kthread that takes care of this rcu_node */
 -				/*  structure, for example, awakening the */
 -				/*  per-CPU kthreads as needed. */
 -	unsigned int node_kthread_status;
 -				/* State of node_kthread_task for tracing. */
+ 	raw_spinlock_t fqslock ____cacheline_internodealigned_in_smp;
  } ____cacheline_internodealigned_in_smp;
 =20
  /*

--Signature=_Wed__22_Aug_2012_14_27_35_+1000_dB4Xpgs2.tV0oX5a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQNF+3AAoJEECxmPOUX5FEOioP/3EpwbaIx/4dV9uEndtUMGJa
IUmWrZZDuCkCcyCXn83iRyB5UQJkFwpztOJeZA5FvgmC5kau7Cm5E9XY9hHp4/bS
ANDMUwzLJdhU4vB+bSPQepatl3ZHfemVL8ayImL2m7CllXlLyjX3W2Xbg4yi5/UF
GxH1EQ/3D8HdPLoF75Kbzp4Qc+GjnU9fCNOb38xuZR1CX06dSsmjWlmUePGEdB33
inxuLRc2/Ru6nGG14TGM3++Ic++b3mQi2Y58pvDnrqeAy2n01oxRAdu6s7gZW7IN
g3vxJw0BFWRgWO23vW1Acf6RDKK+oyqP4oZefXCJblGWeytI3mAHTs5rbbHdxWCV
uRP2aaxpVRMI93xbvjU6ULDAzb3oq3zNCXYuwS3GVGm0eM5HzwTUuW3gZyVUfG1C
pylX7K6UvwMSH3WsjYsGh24awFqDo908H0efcx22j80B3FIYMNbIXam8axM0M9P3
3DqxBGgv9ERLHIvTS11SdYSz6qFMSLlwTK9VzxMhfF5ERVWSFCYpwjZ20FSWtcc/
Nsly4XSaj2ZoT/LDKKGhwWxtPZBhx559pTpd4pZDdKdsoH4Y7Fr2eOjxcvwTznnX
tasBCR2AjSb7EK2V8Zy83+uyDt/N/KFFaRxqbLW7qw4JtkDEcniCmCFruFQBndd0
+vyjnXqBct+/P0zwOBIn
=mI/2
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Aug_2012_14_27_35_+1000_dB4Xpgs2.tV0oX5a--
