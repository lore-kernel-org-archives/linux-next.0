From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: linux-next: build warning after merge of the logfs tree
Date: Sat, 8 May 2010 14:32:00 +0200
Message-ID: <20100508123200.GD21185@logfs.org>
References: <20100507094638.11351234.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100507094638.11351234.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 7 May 2010 09:46:38 +1000, Stephen Rothwell wrote:
>=20
> After merging the logfs tree, today's linux-next build (x86_64 allmod=
config)
> produced this warning:
>=20
> fs/logfs/file.c: In function 'logfs_fsync':
> fs/logfs/file.c:225: warning: unused variable 'super'
>=20
> Introduced by commit c0c79c31c9d5fcc19812c6c35f842baf50ee788a ("logfs=
:
> fix sync").

Thanks, fixed.

J=C3=B6rn

--=20
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
