Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41B3822B7;
	Fri, 14 Aug 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720966; cv=none; b=MgWrBtpPSQV3eVG6rCaKkEl+9wZ0/p2BPSjhD4gA3jiMS7IuI952DZL0Leor2jjbxaOiZuS67KZgAGO/tDMdujMn4gr/YgC9D81WMK80+dX9AYm5yWw27ik/UsZRM5G3mJfGOPTLFZUtMRGE3mFPfMfJ9JmzSZ6mXo/rlbXL0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720966; c=relaxed/simple;
	bh=JuuQMTU0iRHwdrByGp2UMjIQ6QJjlz7FpbWFgtPDilQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+EwTnQan8DYzcD0B3KNCrZcBx2TTWUrv7jHtNJLgFUwA62T0pXj9pYzytk7bxcqqtXeWWL9yxCAl5/uKJ6TcIRr9DL9J2gYqeNze828COzo1NHFY/A6sOM5QWo2FrqBD0q8W4Hu6QvInAxK0D7PSICQfTh/eF85+tM3RnZBn/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=E58JVJGZ; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="E58JVJGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786720951; x=1787325751; i=spasswolf@web.de;
	bh=hFk7A3Hga2ecZPHi4AsnGUOdUM6GiEXHY4BW4+o9Tms=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=E58JVJGZ2pWj12+ftgV1ECe4wlhosBxnRBhrGPRZ/K5/5wZmViJdpC2/GPR1nR9l
	 4ldBPSCFUq3/mjOv8hT+sfcLnqWRPUXcmG2tNTc/DEdKTcS2s5QX2MvTc0Le28j6A
	 Z5IeZMrLVMOLiEO8jHaE+NzAQ0IDfU4XTmcIO3vzdEYgmMR6qQxmscSNqat5HsQ/n
	 NwXmHN9N3Hn5a7HrVDCJJulIaLClP8bO4+NErvdCHdOKsDM5GzZtVsn2UGEa7ffAF
	 Hd9A/M3vLD9gwaCTCOY/aH+G7LF3SC0P57RCpqRL/UwN6kG0N7xPq6tL7uXfuhDUE
	 NqJ0Buff6xYndF0X/Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MfKxj-1xMnga1dOt-00j762; Fri, 14
 Aug 2026 17:17:03 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Leandro Ribeiro <leandro.ribeiro@collabora.com>,
	"Wentland, Harry" <Harry.Wentland@amd.com>,
	Leo Li <Sunpeng.Li@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Jesse Zhang <jesse.zhang@amd.com>,
	Amber Lin <Amber.Lin@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/8] display: fix blend_mode for non-overlay planes
Date: Fri, 14 Aug 2026 17:17:00 +0200
Message-ID: <20260814151701.65222-1-spasswolf@web.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <514c5423b98376e2e6f1fe4bb56c0f3607b4cd52.camel@web.de>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1sEBU9lz15Dmjo8p1ofV2vkfxDivMNI/rM5z9s2l2iIjBJKzkeU
 8N45NFq9PJkQNDOIURkikeKUlPsQ1l6YjlamIh4Z1gDfsWFhg2F8uEh019kFYjyoFr1wn6E
 Fk7b2o1SF1HxSG1ga3LpimAqLhOKAgSWVJ1dCE72v7PrHQoNLv8nAGNEObZD+nC/xzfrLdu
 kqxRtgEi6XWpwUgtZPffg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OgXuJXtNS7o=;I13NaZI7oOrcaaY2jMq0vOKDQ3n
 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
 wnfQFkw==

Previously drm_plane_create_blend_mode_property() was only called for
planes of type DRM_PLANE_TYPE_OVERLAY. Since commit commit 860e748bddcc
("drm: ensure blend mode supported if pixel format with alpha exposed")
this results in warnings from validate_blend_mode_for_alpha_formats().
We fix this here by calling drm_plane_create_blend_mode_property() for
all plane types if the plane is supporting a format with
per_pixel_alpha.

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c  | 5 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/driv=
ers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 62eac6e65334..a6a54351ea56 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -755,13 +755,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manage=
r *dm,
 	struct drm_plane *cursor_plane;
 	bool has_degamma;
 	int res =3D -ENOMEM;
+	struct dc_plane_cap dummy_cap =3D {
+		.per_pixel_alpha =3D 1,
+	};
=20
 	cursor_plane =3D kzalloc_obj(*cursor_plane);
 	if (!cursor_plane)
 		goto fail;
=20
 	cursor_plane->type =3D DRM_PLANE_TYPE_CURSOR;
-	res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, NULL);
+	res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, &dummy_cap);
=20
 	acrtc =3D kzalloc_obj(struct amdgpu_crtc);
 	if (!acrtc)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 824ef3ce5de0..4c0c6a8a0dac 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -2208,8 +2208,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manag=
er *dm,
 	if (res)
 		return res;
=20
-	if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
-	    plane_cap && plane_cap->per_pixel_alpha) {
+	if (plane_cap && plane_cap->per_pixel_alpha) {
 		unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 					  BIT(DRM_MODE_BLEND_PREMULTI) |
 					  BIT(DRM_MODE_BLEND_COVERAGE);
=2D-=20
2.55.0

