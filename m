From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Wed, 16 Mar 2016 15:02:42 -0400
Message-ID: <56E9ADD2.2050500@redhat.com>
References: <20160316121538.6d5a773b@canb.auug.org.au>
 <20160316064953.GA28157@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iJ9hE3MvtuFe7Vbxs6CvixLAn9rSaUUmK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41864 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752216AbcCPTC6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2016 15:02:58 -0400
In-Reply-To: <20160316064953.GA28157@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Faisal Latif <faisal.latif@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iJ9hE3MvtuFe7Vbxs6CvixLAn9rSaUUmK
Content-Type: multipart/mixed; boundary="GceWn92TCvt7OdgJVUL3X6pVXAE5JSXO0"
From: Doug Ledford <dledford@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Faisal Latif <faisal.latif@intel.com>
Message-ID: <56E9ADD2.2050500@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
References: <20160316121538.6d5a773b@canb.auug.org.au>
 <20160316064953.GA28157@gondor.apana.org.au>
In-Reply-To: <20160316064953.GA28157@gondor.apana.org.au>

--GceWn92TCvt7OdgJVUL3X6pVXAE5JSXO0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/16/2016 2:49 AM, Herbert Xu wrote:
> On Wed, Mar 16, 2016 at 12:15:38PM +1100, Stephen Rothwell wrote:
>> Hi Doug,
>>
>> After merging the rdma tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from drivers/infiniband/hw/i40iw/i40iw.h:57:0,
>>                  from drivers/infiniband/hw/i40iw/i40iw_cm.c:63:
>> drivers/infiniband/hw/i40iw/i40iw_osdep.h:175:12: warning: 'struct has=
h_desc' declared inside parameter list
>>             u32 length, u32 value);
>>             ^
>>
>> And it went downhill badly after that.
>>
>> Caused by commit
>>
>>   896545098777 ("crypto: hash - Remove crypto_hash interface")
>>
>> from the crypto tree interacting with commits
>>
>>   786c6adb3a94 ("i40iw: add puda code")
>>   4e9042e647ff ("i40iw: add hw and utils files")
>>
>> (at least) from the rdma tree.
>>
>> Its a bit of a pain finding these conflicts now - it would have been
>> better a few weeks ago.
>>
>> For now, all I can do is to use the rdma tree from next-20160315 for
>> today.
>>
>> Herbert, any hints for Doug, Faisal?
>=20
> crypto_hash is obsolete.  You should be using shash if your input
> is completely linear or ahash if you need SG lists.  For an example
> of how you can do the conversion, have a look at
>=20
> commit 69110e3cedbb8aad1c70d91ed58a9f4f0ed9eec6
> Author: Herbert Xu <herbert@gondor.apana.org.au>
> Date:   Sun Jan 24 21:19:52 2016 +0800
>=20
>     iscsi-target: Use shash and ahash
>=20
> Cheers,
>=20

Pending an update from Intel on the i40iw driver, I have pulled it from
my for-next area.  This should not be a problem with tonight's merge.



--GceWn92TCvt7OdgJVUL3X6pVXAE5JSXO0--

--iJ9hE3MvtuFe7Vbxs6CvixLAn9rSaUUmK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJW6a3SAAoJELgmozMOVy/dUNIQAIqkhLMF2f8rFn9nn5xH4V8W
OlAnLLzxVLr5LUe0jrNkj6mbRaiJwFKN2TIc3LiCNJ1L+U6CakIVcbDLy7O5WUre
hJujZKgkxSn7yeYl8alkrwC/X3OvLgXhM4I59cNL76PCasrybymYdo2jA59Rnsd/
yTvV6ALgP2IC3XABqWCT/irTykH+KUkEjEaJoNhheh6z7zz1Yg2qrqiIxEA6ryHY
BRNVmWH7aFh7MtG0SsbL8nilz5ifDVt5tGfzppqmlbhofFJicEtRsaDicrgedAgy
ZEZ5y0uznLwXPjw6qwSzW0d388cggXHm85Yn3QBG30v9iAlTop4zBkJh1YtBQCCT
TNB0xuzr8z/0U7MuqGSVFQnSzVc8yJ2ajzIfslZSr18zcg0y28lJImcxnZ1jyiVV
eku1/7s9Eo8Rpq2dWpcrxIdXT/SmlxsB89Hy02Co7ZlMUD8CPyarOmImudYp2D+u
ZEfvtUxEzPUCmV0Ge3lYoFLLxFHwBMhH3Oafrbd7sFfmOVNT85Ca91fXP2BrcSoB
QI3dStTEiX64TCvxSd77sunGW1QBf/2o5+hGcqLynzKs3O71eA7MwitAH4da3xlE
2h99+HcXsW+Y3yxLIrx7y6YiQOc+22iYwy8PtDfJOCylwrRYA+DOi15Hz+SOGRBc
ebWqSbq/0chySS1H3OZW
=S05P
-----END PGP SIGNATURE-----

--iJ9hE3MvtuFe7Vbxs6CvixLAn9rSaUUmK--
