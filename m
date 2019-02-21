From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Thu, 21 Feb 2019 12:34:42 +0000
Message-ID: <20190221123440.GD17501@mtr-leonro.mtl.com>
References: <20190221171332.262cf619@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221171332.262cf619@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Wilcox <willy@infradead.org>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 21, 2019 at 05:13:32PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the xarray tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from include/linux/uio.h:12,
>                  from include/linux/socket.h:8,
>                  from include/rdma/rdma_cm.h:37,
>                  from drivers/infiniband/core/restrack.c:6:
> drivers/infiniband/core/restrack.c: In function 'rt_xa_alloc_cyclic':
> include/linux/kernel.h:40:18: warning: passing argument 3 of '__xa_alloc' makes pointer from integer without a cast [-Wint-conversion]
>  #define U32_MAX  ((u32)~0U)
>                   ^~~~~~~~~~
> drivers/infiniband/core/restrack.c:26:27: note: in expansion of macro 'U32_MAX'
>   err = __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
>                            ^~~~~~~
> In file included from include/linux/radix-tree.h:31,
>                  from include/linux/fs.h:15,
>                  from include/linux/seq_file.h:11,
>                  from arch/powerpc/include/asm/machdep.h:12,
>                  from arch/powerpc/include/asm/archrandom.h:7,
>                  from include/linux/random.h:166,
>                  from include/linux/net.h:22,
>                  from include/linux/skbuff.h:29,
>                  from include/linux/if_arp.h:26,
>                  from include/rdma/ib_addr.h:39,
>                  from include/rdma/rdma_cm.h:39,
>                  from drivers/infiniband/core/restrack.c:6:
> include/linux/xarray.h:524:61: note: expected 'void *' but argument is of type 'unsigned int'
>  int __must_check __xa_alloc(struct xarray *, u32 *id, void *entry,
>                                                        ~~~~~~^~~~~
> drivers/infiniband/core/restrack.c:26:36: error: incompatible type for argument 4 of '__xa_alloc'
>   err = __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
>                                     ^~~~~
> In file included from include/linux/radix-tree.h:31,
>                  from include/linux/fs.h:15,
>                  from include/linux/seq_file.h:11,
>                  from arch/powerpc/include/asm/machdep.h:12,
>                  from arch/powerpc/include/asm/archrandom.h:7,
>                  from include/linux/random.h:166,
>                  from include/linux/net.h:22,
>                  from include/linux/skbuff.h:29,
>                  from include/linux/if_arp.h:26,
>                  from include/rdma/ib_addr.h:39,
>                  from include/rdma/rdma_cm.h:39,
>                  from drivers/infiniband/core/restrack.c:6:
> include/linux/xarray.h:525:3: note: expected 'struct xa_limit' but argument is of type 'void *'
>    struct xa_limit, gfp_t);
>    ^~~~~~~~~~~~~~~
> drivers/infiniband/core/restrack.c:29:28: warning: passing argument 3 of '__xa_alloc' makes pointer from integer without a cast [-Wint-conversion]
>    err = __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
>                             ^~~~~
> In file included from include/linux/radix-tree.h:31,
>                  from include/linux/fs.h:15,
>                  from include/linux/seq_file.h:11,
>                  from arch/powerpc/include/asm/machdep.h:12,
>                  from arch/powerpc/include/asm/archrandom.h:7,
>                  from include/linux/random.h:166,
>                  from include/linux/net.h:22,
>                  from include/linux/skbuff.h:29,
>                  from include/linux/if_arp.h:26,
>                  from include/rdma/ib_addr.h:39,
>                  from include/rdma/rdma_cm.h:39,
>                  from drivers/infiniband/core/restrack.c:6:
> include/linux/xarray.h:524:61: note: expected 'void *' but argument is of type 'u32' {aka 'unsigned int'}
>  int __must_check __xa_alloc(struct xarray *, u32 *id, void *entry,
>                                                        ~~~~~~^~~~~
> drivers/infiniband/core/restrack.c:29:35: error: incompatible type for argument 4 of '__xa_alloc'
>    err = __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
>                                    ^~~~~
> In file included from include/linux/radix-tree.h:31,
>                  from include/linux/fs.h:15,
>                  from include/linux/seq_file.h:11,
>                  from arch/powerpc/include/asm/machdep.h:12,
>                  from arch/powerpc/include/asm/archrandom.h:7,
>                  from include/linux/random.h:166,
>                  from include/linux/net.h:22,
>                  from include/linux/skbuff.h:29,
>                  from include/linux/if_arp.h:26,
>                  from include/rdma/ib_addr.h:39,
>                  from include/rdma/rdma_cm.h:39,
>                  from drivers/infiniband/core/restrack.c:6:
> include/linux/xarray.h:525:3: note: expected 'struct xa_limit' but argument is of type 'void *'
>    struct xa_limit, gfp_t);
>    ^~~~~~~~~~~~~~~
>
> Caused by commit
>
>   fd47c2f99f04 ("RDMA/restrack: Convert internal DB from hash to XArray")
>
> from the rdma tree interacting with commit
>
>   a3e4d3f97ec8 ("XArray: Redesign xa_alloc API")
>
> from the xarray tree.

Thanks Stephen, your change looks good.

Matthew, really? change of API in -rc7? And it after you pushed us to
base our -next on -rc5 after another API change? What should we do now?

Can you please ensure that you are sending your pull request to Linus,
after RDMA pull request will be successfully merged?

Thanks

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcbprgAAoJEORje4g2clinQqQP/3qNED089Odg1mbtQssEfK3n
LkDkm4i0/XyFPP4LnpVi0S/pIoILK5ZsUL9MzRyC/KZsUGZhtadLiqnLYlkgi6Rk
qwcGaubNBBZlRpmQa+r4fNPWafAj/+20svZcdsDwYEXdDKIrQRz1IE8ZSdKQ72HW
isZBk9vp1v695WpSlOZzj/ePL4uCes9usqIpML+i2AvDPiAqjY3tx1DtuMUT2r3x
xULExYuqTETbH4G72YXgKHs+l9cTAs/44Crcfz/wGmjF81aP/Q5ufrN2ZTbtZOJn
L2eeJ3T8jPlA/V04YSbAG0EuArv2VKfkr79UtdhA53hD+HWTIOGbJ80evnssjCMI
brexMbdaUtpe6ZG4d5IqjWFhWDLtIryrV1DXqg11cdp0bhLrr8BHnoPM8x/N/Jxg
DVg5ep6S9jEk9IE3TCOvdVpGb2FWSDVnoDvY6cmiifpT94HdS9fJf59Ku5VG/+vV
pppR7oIaXIU7PeScnC/KcaXkb40VQGTiKhV0UlWE1UuDxAfcT0k0Ax6nfA/cgdEf
pKdDsrDnQ7dovRVL5MtBso5MZXf9pkaXhZlyT9b31i+ZKu5SGKS0rmelSQhbH06G
ithKdSNs825ld2l0QoZ1lPaBYNKLOxRE7Vd8JKKpXS/sH8K61GrrKlf4lvaBc+d9
3chYIkv7LmXt1RxrY7ye
=dq3x
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--
