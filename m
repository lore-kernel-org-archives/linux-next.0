From: AA <hgang.m@hotmail.com>
Subject: where should I map 0x8000,0000 ~ 0xfc00,0000 to ?
Date: Wed, 11 Mar 2009 16:53:40 +0800
Message-ID: <COL104-W798BDB8F0AC936464E80D7EB9E0@phx.gbl>
References: <20090310195534.8f8f3c7a.sfr@canb.auug.org.au>
	<49B67552.5070307@in.ibm.com>
	<COL104-W4161BE11903ACD5CE8A80EB9E0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1464708375=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <COL104-W4161BE11903ACD5CE8A80EB9E0@phx.gbl>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: sachinp@in.ibm.com, sfr@canb.auug.org.au, linux-kernel@zh-kernel.org
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============1464708375==
Content-Type: multipart/alternative;
	boundary="_11d961f8-8821-4839-8948-bd38749fff34_"

--_11d961f8-8821-4839-8948-bd38749fff34_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: quoted-printable


Hi all
 I am newer to linux.
=20
 My board is MPC750+MPC106, and I use MAPB for MPC106.
 Due to 106 datasheet,=20
 0x8000,0000 -- 0xFC00,0000 for PCI memory space.
=20
 As you know, user space is 0~0xbfff,ffff (3G).=20
 0xc000,0000 ~ 0xffff,ffff(1G) is for kernel.

 And my question is:
 1) where should I map this address space to ?
 2) user application can access this address space directly?
=20
=20
_________________________________________________________________
=C3=CE=BB=C3K=CD=BC=A3=AC=B0=D9=B1=E4=D4=EC=D0=CD=A3=AC=C8=C3=C4=E3=B5=C4=
=D5=D5=C6=AC=D3=EB=D6=DA=B2=BB=CD=AC=A3=AC=BF=EC=C0=B4MClub=CA=D4=CA=D4=B0=
=C9=A3=A1
http://club.msn.cn/?form=3D3
--_11d961f8-8821-4839-8948-bd38749fff34_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
.hmmessage P
{
margin:0px;
padding:0px
}
body.hmmessage
{
font-size: 10pt;
font-family:Verdana
}
</style>
</head>
<body class=3D'hmmessage'>
Hi all<BR>&nbsp;I am newer to linux.<BR>&nbsp;<BR> My board is MPC750+MPC=
106, and I use MAPB for MPC106.<BR>&nbsp;Due to 106 datasheet,&nbsp;<BR> =
0x8000,0000 -- 0xFC00,0000 for PCI memory space.<BR>&nbsp;<BR> As you kno=
w, user space is 0~0xbfff,ffff (3G).&nbsp;<BR> 0xc000,0000 ~ 0xffff,ffff(=
1G) is for kernel.<BR><BR>&nbsp;And my question is:<BR>&nbsp;1) where sho=
uld I map this address space to ?<BR>&nbsp;2) user application can access=
 this address space directly?<BR>&nbsp;<BR> <br /><hr />=B0=D1MSN=D7=B0=BD=
=F8=CA=D6=BB=FA=A3=AC=B8=FC=B6=E0=C1=C4=CC=EC=C0=D6=C8=A4=B5=C8=C4=E3=CD=DA=
=BE=F2=A3=A1 <a href=3D'http://mobile.msn.com.cn/' target=3D'_new'>=C1=A2=
=BF=CC=CF=C2=D4=D8=A3=A1</a></body>
</html>
--_11d961f8-8821-4839-8948-bd38749fff34_--

--===============1464708375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@ozlabs.org
https://ozlabs.org/mailman/listinfo/linuxppc-dev
--===============1464708375==--
