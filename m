From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the xarray
 tree
Date: Tue, 2 Oct 2018 17:39:56 +1000
Message-ID: <20181002173956.7e5ca5c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4v0_9cQEZYInn9tmPdZtC0M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4v0_9cQEZYInn9tmPdZtC0M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/workingset.c

between commit:

  3159f943aafd ("xarray: Replace exceptional entries")
  bb7bbd491985 ("mm: Convert workingset to XArray")

from the xarray tree and commit:

  2685383fce55 ("mm: workingset: don't drop refault information prematurely=
")
  544eea1cbede ("mm: workingset: tell cache transitions from workingset thr=
ashing")

from the akpm-current tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/workingset.c
index 5cfb29ec3fd9,c3a9bb797b6d..000000000000
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@@ -155,9 -167,8 +167,8 @@@
   * refault distance will immediately activate the refaulting page.
   */
 =20
 -#define EVICTION_SHIFT	(RADIX_TREE_EXCEPTIONAL_ENTRY + \
 +#define EVICTION_SHIFT	((BITS_PER_LONG - BITS_PER_XA_VALUE) +	\
- 			 NODES_SHIFT +				\
- 			 MEM_CGROUP_ID_SHIFT)
+ 			 1 + NODES_SHIFT + MEM_CGROUP_ID_SHIFT)
  #define EVICTION_MASK	(~0UL >> EVICTION_SHIFT)
 =20
  /*
@@@ -170,22 -181,28 +181,27 @@@
   */
  static unsigned int bucket_order __read_mostly;
 =20
- static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned long evi=
ction)
+ static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned long evi=
ction,
+ 			 bool workingset)
  {
  	eviction >>=3D bucket_order;
 +	eviction &=3D EVICTION_MASK;
  	eviction =3D (eviction << MEM_CGROUP_ID_SHIFT) | memcgid;
  	eviction =3D (eviction << NODES_SHIFT) | pgdat->node_id;
+ 	eviction =3D (eviction << 1) | workingset;
 -	eviction =3D (eviction << RADIX_TREE_EXCEPTIONAL_SHIFT);
 =20
 -	return (void *)(eviction | RADIX_TREE_EXCEPTIONAL_ENTRY);
 +	return xa_mk_value(eviction);
  }
 =20
  static void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
- 			  unsigned long *evictionp)
+ 			  unsigned long *evictionp, bool *workingsetp)
  {
 -	unsigned long entry =3D (unsigned long)shadow;
 +	unsigned long entry =3D xa_to_value(shadow);
  	int memcgid, nid;
+ 	bool workingset;
 =20
 -	entry >>=3D RADIX_TREE_EXCEPTIONAL_SHIFT;
+ 	workingset =3D entry & 1;
+ 	entry >>=3D 1;
  	nid =3D entry & ((1UL << NODES_SHIFT) - 1);
  	entry >>=3D NODES_SHIFT;
  	memcgid =3D entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
@@@ -387,16 -415,16 +414,16 @@@ static unsigned long count_shadow_nodes
  	 * each, this will reclaim shadow entries when they consume
  	 * ~1.8% of available memory:
  	 *
 -	 * PAGE_SIZE / radix_tree_nodes / node_entries * 8 / PAGE_SIZE
 +	 * PAGE_SIZE / xa_nodes / node_entries * 8 / PAGE_SIZE
  	 */
- 	if (sc->memcg) {
- 		cache =3D mem_cgroup_node_nr_lru_pages(sc->memcg, sc->nid,
- 						     LRU_ALL_FILE);
- 	} else {
- 		cache =3D node_page_state(NODE_DATA(sc->nid), NR_ACTIVE_FILE) +
- 			node_page_state(NODE_DATA(sc->nid), NR_INACTIVE_FILE);
- 	}
- 	max_nodes =3D cache >> (XA_CHUNK_SHIFT - 3);
+ #ifdef CONFIG_MEMCG
+ 	if (sc->memcg)
+ 		pages =3D page_counter_read(&sc->memcg->memory);
+ 	else
+ #endif
+ 		pages =3D node_present_pages(sc->nid);
+=20
 -	max_nodes =3D pages >> (RADIX_TREE_MAP_SHIFT - 3);
++	max_nodes =3D pages >> (XA_CHUNK_SHIFT - 3);
 =20
  	if (!nodes)
  		return SHRINK_EMPTY;

--Sig_/4v0_9cQEZYInn9tmPdZtC0M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzIMwACgkQAVBC80lX
0GyiNwf+LK0XNefW5rusNsN1oHbpH1wQKNpSKPHwfW/H+Gi3+743c3j1u1Q5CsXd
61W99lBP4b3q4WjZ8CdhAdBky/67a3BqRTQXaFq4jbqP4tLjhpoonYBBvuQeY7Jv
vemYz9RkD5lHyYfg7GIz0XiyWhumOeX8tbHjw5AyyxgHuYbElPKznS2dx1HTFWAw
WfFMnOAlOi68VtFgR/N5d7l/WshZIyBaTg/FLzmP3foO2mmVnUeIrMbcCkojpTbg
XI+lbSW3SleTiM72bHipXBSYbIGD5tg8NuzhdspqiWjmmiBXi5EBR+GPNx62ds2+
LhRC4hPycSRRMOALFa/ShYIWp+ypuw==
=dNPz
-----END PGP SIGNATURE-----

--Sig_/4v0_9cQEZYInn9tmPdZtC0M--
