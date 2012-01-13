From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Subject: FW: Please include modem_shm in linux-next
Date: Fri, 13 Jan 2012 14:02:28 +0100
Message-ID: <81C3A93C17462B4BBD7E272753C105791FB10FA215@EXDCVYMBSTM005.EQ1STM.local>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_81C3A93C17462B4BBD7E272753C105791FB10FA215EXDCVYMBSTM00_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113]:51721 "EHLO
	eu1sys200aog102.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753187Ab2AMNDD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jan 2012 08:03:03 -0500
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

--_002_81C3A93C17462B4BBD7E272753C105791FB10FA215EXDCVYMBSTM00_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

> That is not a URL I can pull ... git://... please

Sure, I'll give you a proper URL next time.
=20
> I don't like adding new trees during the merge window.  If this code is
> for v3.4, please ping me after v3.3-rc1 is out. =20

This is more likely to go into v3.4 - so if you don't take it now I'll ping
you later.

> Is the code in the old
> xshm tree going to be sent to Linus Torvalds during this merge window?

I might have to harvest more "Reviewed-by" before sending a merge request
to Torvalds, so v3.4 is more likely.

> I just had a look at this new version (I used
> git://github.com/sjurbren/modem-ipc.git branch for-next to fetch it) and
> there seems like a large amount of churn in the code if it is to be
> merged this merge window.   Also, the last patch (that adds the cif shm
> driver) you effectively change the module name of an existing driver - I
> am not sure what impat that will have on existing users.

Yes, I see - the restructuring in drivers/net/ is too big for this merge wi=
ndow.

> I would also like to hear from Linus Walleij ...


Regards,
Sjur

--_002_81C3A93C17462B4BBD7E272753C105791FB10FA215EXDCVYMBSTM00_
Content-Type: application/pgp-signature; name="ATT00004.dat"
Content-Description: ATT00004.dat
Content-Disposition: attachment; filename="ATT00004.dat"; size=853;
	creation-date="Fri, 13 Jan 2012 14:02:35 GMT";
	modification-date="Fri, 13 Jan 2012 14:02:35 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjQuMTEgKEdO
VS9MaW51eCkNCg0KaVFJY0JBRUJDQUFHQlFKUEQzYVBBQW9KRUVDeG1QT1VYNUZFbUVvUC9SSlRY
dVJaNC9saEZGV2NEaURYcHNpTw0KenBjUW83SG5kYWVUakovMnVBbmRhVkhaRUFuUmVHQTdLTUVX
Z2YxZk1QeThERmJQRkxXVi9GMUZCMWlpRlFIbg0KR25QZW1DVTloYlhaTVlKWGdrVnNOQ09KTVRH
eEJ2aWZJYWpSM0owT3hPU3pmaUhCaEhEeTg1bzEvb1VFZjdHbQ0Kdy9udnE1SWpScjhSWk5qWFdR
M2tGMWc1RTJnQkpvWEZNdG9mRk1hY1F0K09ranBIUTlRNWtUOGNmRWpJekRkUA0KdVpoTWNtMkZo
azdkQmxJMG9rTkcxTmsxUHlmdS8vTVo0a3FpOXJrUkhIaUFhTVZvL0tOM3BKbkF1TVQ2MGxNag0K
cTMvbTZLekFqcENrRlN0NU4xMUdvWDh6U3dCTlNqZjM5NXBkT0s5ZGMvc2tMRVNNdERvVGI1bnZN
M09lanpudg0KRDljVUFURHl6ckFBN3FLQzh1NnIyOGg1QTQ3Z2l0WlhDOWJXdDlwRG5FOUdrcDlQ
a3RVcEpGTGRmVy85Z0lGNg0KTEkrQmp1S1JkbXlWRWx5UnYyY3Nyc0RoNTNsWGFGWHlkNXU4ZGd4
U2F0d3FZbGI0dmJzV1lYMFlDSEU4dHQ2dg0KUDdYYTJKUEhOTTVXRFhNSmwyRk1ZRi9meEZwUkhj
VFkxRkJKZUp5MS9LMDliQ29qS3ZlMWRFWVJGYldJTklZaQ0KNmNkaUtZN01LSDZzd2dBYytMd0kr
d2NDSkp3NzNCVHN3clJha3FTQWZyRUhJMjkyMTdyUnd1S05ITmtYc2dwdA0KTTZkdGJuVVU1TG5t
dElyZmxrNWp6NzBpRWNmRE1lWU0wS3RPdi9vSy8xTUI0TC8yNEN0bWtKV2pNbVZTcitHWA0KYXVJ
RjJwUFJzckVNdWxabEhsb00NCj02TFFpDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--_002_81C3A93C17462B4BBD7E272753C105791FB10FA215EXDCVYMBSTM00_--
