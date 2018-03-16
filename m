From: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Subject: Re: mmotm 2018-03-14-16-24 uploaded (lustre)
Date: Fri, 16 Mar 2018 14:47:48 +1100
Message-ID: <87605wbs0r.fsf@notabene.neil.brown.name>
References: <20180314232442.rL_lhWQqT%akpm@linux-foundation.org>
 <5c65e935-a6d9-2f80-18ac-470ed38ba439@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5859420471850651641=="
Return-path: <lustre-devel-bounces-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org>
In-Reply-To: <5c65e935-a6d9-2f80-18ac-470ed38ba439-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <http://lists.lustre.org/options.cgi/lustre-devel-lustre.org>,
 <mailto:lustre-devel-request-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.lustre.org/pipermail/lustre-devel-lustre.org/>
List-Post: <mailto:lustre-devel-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org>
List-Help: <mailto:lustre-devel-request-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org?subject=help>
List-Subscribe: <http://lists.lustre.org/listinfo.cgi/lustre-devel-lustre.org>,
 <mailto:lustre-devel-request-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org?subject=subscribe>
Errors-To: lustre-devel-bounces-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org
Sender: "lustre-devel" <lustre-devel-bounces-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org>
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mhocko-AlSwsSmVLrQ@public.gmane.org, mm-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, lustre-devel-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org
List-Id: linux-next.vger.kernel.org

--===============5859420471850651641==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15 2018, Randy Dunlap wrote:

> On 03/14/2018 04:24 PM, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org wrote:
>> The mm-of-the-moment snapshot 2018-03-14-16-24 has been uploaded to
>>=20
>>    http://www.ozlabs.org/~akpm/mmotm/
>
> (not from the mmotm patches, but in its linux-next.patch)
>
> CONFIG_LUSTRE_FS=3Dy
> # CONFIG_LUSTRE_DEBUG_EXPENSIVE_CHECK is not set
>
>
> In file included from ../drivers/staging/lustre/include/linux/libcfs/libc=
fs.h:42:0,
>                  from ../drivers/staging/lustre/lustre/obdclass/lu_object=
.c:44:
> ../drivers/staging/lustre/lustre/obdclass/lu_object.c: In function 'lu_co=
ntext_key_degister':
> ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1410:51: error: der=
eferencing pointer to incomplete type
>           __func__, key->lct_owner ? key->lct_owner->name : "",
>                                                    ^

Thanks for the report.
Arnd Bergmann posted a patch to fix this on Tuesday

Message-Id: <20180313130425.3975930-1-arnd-r2nGTMty4D4@public.gmane.org>

http://lkml.kernel.org/r/<20180313130425.3975930-1-arnd-r2nGTMty4D4@public.gmane.org>

so the error should disappear soon.

Thanks,
NeilBrown


> ../drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:123:41: not=
e: in definition of macro '__CDEBUG'
>    libcfs_debug_msg(&msgdata, format, ## __VA_ARGS__); \
>                                          ^
> ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1409:3: note: in ex=
pansion of macro 'CDEBUG'
>    CDEBUG(D_INFO, "%s: \"%s\" %p, %d\n",
>    ^
> ../drivers/staging/lustre/lustre/obdclass/lu_object.c: In function 'lu_co=
ntext_key_quiesce':
> ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1550:42: error: der=
eferencing pointer to incomplete type
>            key->lct_owner ? key->lct_owner->name : "",
>                                           ^
> ../drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:123:41: not=
e: in definition of macro '__CDEBUG'
>    libcfs_debug_msg(&msgdata, format, ## __VA_ARGS__); \
>                                          ^
> ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1548:4: note: in ex=
pansion of macro 'CDEBUG'
>     CDEBUG(D_INFO, "%s: \"%s\" %p, %d (%d)\n",
>     ^
>
>
>
> --=20
> ~Randy

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlqrPmQACgkQOeye3VZi
gbnIgg/9H8TxMGQ0KLNoeEmN640Hw9FYzKHUWhYIWGFRHpNtHrpyVlvserEHIxjN
LshHyZOLxft9KbkYvzptmNLhAYYoN996HlTvXakH8brmKIQ8oCM5igCRXa0hBevG
Ziz4Fyx+yWix3wmxJhUiPlzrIMF/gZTjs0vmVERKDnTxPAgrzLdXdG501iD67SK9
Qid6hy5x1TvWHWW6WMlX9QJi5UvALYBwxYD3q7R+IKXnTdkUUXwxZ4u21/3Rb3ZI
Oozk8muX2VOK7T48wdVLva6r7g/NSbisuEV8pBQRyKUmib0tFa7MZP/QMspYfNdh
+126mirhrBGduRZ1VZJ1JR8lTQxkxlTFJPQS1JNvRxG6KR1CmEXjP3huH6/ubper
6/Y1K7TJlqRbMZveVPZUZtBNr5uy3OnGlKxlci9tSLUDqBvJxs6JqWo4+3hNNsVs
7NW74WMStXNfP0BUI1AZTEAheNGWdnMiM6vdfiz550n9tvsfoMQFF4Zi/2M0+dlv
qXk37eEwstNOs4vK63F0KQoogm71CUOivRuN4BY6noEAecznmY0VcaZteiIWYXKz
G4QflgvIKUQyBqruOYKkwzUsRlKZOIcb/ymIpSeUn5P+aRntGpZ3t19c6vnq9aON
pQc/N201hwlI+LkG6F4qSl7P9V9HNFG8eAksOEB+wPtDhRfzEjM=
=HgXN
-----END PGP SIGNATURE-----
--=-=-=--

--===============5859420471850651641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
lustre-devel mailing list
lustre-devel-aLEFhgZF4x6X6Mz3xDxJMA@public.gmane.org
http://lists.lustre.org/listinfo.cgi/lustre-devel-lustre.org

--===============5859420471850651641==--
