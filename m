From: Song Liu <songliubraving@fb.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Wed, 2 May 2018 06:05:46 +0000
Message-ID: <2E9CBF79-3075-48FF-87D8-834DCE1E5D9D@fb.com>
References: <20180502120921.654cc338@canb.auug.org.au>
 <0942C278-336F-4795-BE63-FAD7FBAA231B@fb.com>
 <20180502155014.4f5acdcb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502155014.4f5acdcb@canb.auug.org.au>
Content-Language: en-US
Content-ID: <FC68B4369D5BAF49A4B94DC9010C5B2F@namprd15.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>
List-Id: linux-next.vger.kernel.org



> On May 1, 2018, at 10:50 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
>=20
> Hi Song,
>=20
> On Wed, 2 May 2018 04:40:20 +0000 Song Liu <songliubraving@fb.com> wrote:
>>=20
>>> - 	CHECK(build_id_matches < 1, "build id match",
>>> - 	      "Didn't find expected build ID from the map\n");
>>> + 	if (CHECK(build_id_matches < 1, "build id match",
>>> -		  "Didn't find expected build ID from the map"))
>>> ++		  "Didn't find expected build ID from the map\n")) =20
>>=20
>> ^^^  Is there a "+" at the beginning of this line?=20
>=20
> No, this is a merge resolution diff, so the ++ means that the line did
> not appear in either parent commit.

Hi Stephen,

Thanks for the explanation!=20

Song
