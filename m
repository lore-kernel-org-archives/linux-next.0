From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Thu, 4 Jun 2015 19:51:36 +0200
Message-ID: <20150604175135.GA10262@potion.brq.redhat.com>
References: <20150604181308.16fbe6cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150604181308.16fbe6cf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Darren Hart <dvhart@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

2015-06-04 18:13+1000, Stephen Rothwell:
> After merging the drivers-x86 tree, today's linux-next build (x86_64 =
allmodconfig)
> failed like this:
>=20
> ERROR: "acpi_bus_get_status_handle" [drivers/platform/x86/pvpanic.ko]=
 undefined!
>=20
> Caused by commit b8f8cf6b02b6 ("pvpanic: handle missing _STA correctl=
y").

Classic, I only built with Y, sorry.

acpi_bus_get_status_handle is not exported, so a simple solution would
be to make it so.  Or it's possible to rewrite the patch in a way that
uses current infrastructure.

Would you prefer a patch to export it, a build fix on top of
b8f8cf6b02b6 or a replacement patch?

Thanks.

A fix on top of b8f8cf6b02b6:
---8<---
pvpanic: use acpi_bus_get_status to fix build

The previous version used acpi_bus_get_status_handle, which was not
being exported, so module build blew up;  switch to acpi_bus_get_status
and use the status it populates.

Populated status is a bitfield so we can make the code self-documenting=
=2E
We do not check 'present' because 'enabled' has to be false in that cas=
e
by specification.  Older QEMUs set 0xff to status and newer ones do 0xb=
=2E

Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
---
 drivers/platform/x86/pvpanic.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/pvpanic.c b/drivers/platform/x86/pvpa=
nic.c
index 7b6860333267..fd86daba7ffd 100644
--- a/drivers/platform/x86/pvpanic.c
+++ b/drivers/platform/x86/pvpanic.c
@@ -92,12 +92,13 @@ pvpanic_walk_resources(struct acpi_resource *res, v=
oid *context)
=20
 static int pvpanic_add(struct acpi_device *device)
 {
-	acpi_status status;
-	u64 ret;
+	int ret;
=20
-	status =3D acpi_bus_get_status_handle(device->handle, &ret);
+	ret =3D acpi_bus_get_status(device);
+	if (ret < 0)
+		return ret;
=20
-	if (ACPI_FAILURE(status) || (ret & 0x0B) !=3D 0x0B)
+	if (!device->status.enabled || !device->status.functional)
 		return -ENODEV;
=20
 	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
