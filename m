Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795068837;
	b=T9c83rHpnpZBiY/hE7CX7dEPbaJG00jiG5kiRFU2+kCPr6j9psBydCdSQOMb3BOSDOLi
	 GY9iTwcjIGbN9mNFwTH+E3dbFovBaYI319iTQxK5QVrVhLgQ8ycNFS0dA5yhzZC9hYTfu
	 qeRhNVCQ1PYcA7uD2vcMmInUe/O4tqRzpfd7zTyEwgq1u6zWzndjBdY94HDnoOhGmRy7s
	 7fFLTrF392vN1NCf4h09g0wkLlKUz6L6wk35f1JW+iNhm/E1NRyg4Bf6ahhMDGE0YJ6o3
	 q7sJwMhp4PGiO1mQ1koijsy8xA5t+TTz1/jTrx7TPjqCyWqWbMwITf1dPolpGotSn8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068837;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Y7l/IFz9Kfi01DnKJQ/4vchLgja+tMgQfkE6T2MHBno=;
	b=CaMNQ/yiXdrMowIgX+hB7CdmQaZm3QRDkGaioJO+gvhTdSuCrRzwmzA+Fz9AkprVmgtv
	 juPzVozbGFx0GlsYtQpr4HXX2LG6Y2Jl/UrcI7mbBI7HCZn7AqkPZ3aSKR4E1aJb67KDs
	 2kYye43RYgMa7vujXGP14Q7j9AFJxZBHvP4z5AQXFA0pkP5o6lgnN/EDgqCSuqHBaqv0z
	 /YwS3lyffaL7lXu+dc+zB4RP9wV/qeWZ2arBd5VsoKlWG79lSwo+gV7NcLq7aosqVX4qF
	 iXqZ9PxxhbA70ir+Mra7J7iHS+7B1tgazSD0bsjLcKd+gfUBjvOIU0qgUgOKtcAp5wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ihXuc5cb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.26
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011026.outbound.protection.outlook.com [52.103.12.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87EE606A320;
	Thu, 19 Nov 2026 06:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87EE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ihXuc5cb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtm3qoZbaw2WCpy4StSASXl70aSdchDzNvXOwLhj8miP6uFPHRZxoMMGfa4ZAiUTRprC5H6K+kegu+LDrAahlyZw1APVvI7LEj+ZSm3fG6VPDUYPmFMJKalZ9leVv+/o1Eqbt+TV3+TXB7rP9966F5fe7ll/d2Mtxg1TGBrQszjCY1uDnpgNtkGKO9qxQaD1Ava+7znHdI/phLfW3v1DXmyVF8QE5vHy5hvB3Qx3YWRkMtS4z7+pN313QIFRaTgoFvAPOs86xDBkxrdXe4RiVQKambRTnbyJrpdkqkwx7kA0PiilA45YzpOfrkOqRpF0rdDLCw2ttWpKZs65t8IRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7l/IFz9Kfi01DnKJQ/4vchLgja+tMgQfkE6T2MHBno=;
 b=Jtpw6fk781I7bdd2L02t5EF6sFrVSqLsHGgLp28acwtT5yJbahOoJx+uso3zIkHUh47BoMIlpnqAwmMSw3p4tIYhQN/NrFwP3DoQ3RUWr8G6tAN+PuAQKhKdwj56pDDJJMuX+2lcYr7Fm39jof5k5Snr7dM+tnMjOlr/iCyBiy6pa1i7dP9EIcGnh1zh+CQNxKGN9mTxVr+PZ04my+1eSeMp9lg7GfW7uF+kw3k1IfIaxFXpf4X2nYyohgO8Nvrw4MY8bXIIQhJ/pq21N3TJduFQ6kHdGZWQFhlI/IBPm2yoFP85xa5ghbgbpjci3TRQq/6WGpGHBloFSUMnjF8bcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7l/IFz9Kfi01DnKJQ/4vchLgja+tMgQfkE6T2MHBno=;
 b=ihXuc5cbIDL8obP0/yyQHvdRMM5yaWsqKbubS7vZ4xtSbZmqA2p8dptzXbCObwzIClfNOFOg/kQS4XuRw/OAb1orbxA1MptSMeMnPkb53/aD2HmtqbPlT79A0PjfaFvbTOQ59bv8h04wG6JZZkl8Kyq7HQJLFyQ4ZmoU8dIs+IAlMyzxSzeX54OkzAsYdx9aeAjvHrn41I9qB+zKb31dAEsWAnvLUlpGdcsPLVLAJuXC9NfNdb7HGHniocXeDOnofiguz8ZP6deN1HBBn1S2rOC2rRw6ziLtc0At/lXoHxeTEwBdQLBfq2JfnhA+bns8Wm3epU363mKK4WCFdBPEJQ==
Received: from PH7PR19MB6658.namprd19.prod.outlook.com (2603:10b6:510:1ac::6)
 by CH2PR19MB8841.namprd19.prod.outlook.com (2603:10b6:610:27f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 06:13:54 +0000
Received: from PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32]) by PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 06:13:54 +0000
From: desobei <desobei@outlook.com>
To: lucid_duck@justthetip.ca
Cc: broonie@kernel.org,
	airlied@redhat.com,
	simona.vetter@ffwll.ch,
	jfalempe@redhat.com,
	tzimmermann@suse.de,
	luyuantao@kylinos.cn,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Date: Thu, 19 Nov 2026 01:13:42 -0500
Message-ID:
 <PH7PR19MB6658FDBDD012399C6E8D330FAF792@PH7PR19MB6658.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019190959.799653-1-lucid_duck@justthetip.ca>
References: <20261019190959.799653-1-lucid_duck@justthetip.ca>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::10) To PH7PR19MB6658.namprd19.prod.outlook.com
 (2603:10b6:510:1ac::6)
X-Microsoft-Original-Message-ID: <20261119061342.4191-1-desobei@outlook.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR19MB6658:EE_|CH2PR19MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fe4936-6c25-42a8-be11-08df4604498d
X-MS-Exchange-SLBlob-MailProps:
	02NmSoc12Dcj/mAxI/NGvzdUkjNASRo/69TQX6PVGRUu/HHJlbyIKKaxDvB/cVwEDmYGbhTtVrTAh4SjszI0E0ai4QM4k+YdIMOKq/oXOLHYvFzLrzozni0rjZdGBLPC6FSXmMMcQWlL9ZbPZE9vy9thE3r7xKLziB2BIEq1f7WCP2IicJ4W63qsPpe1UXs/Rfc96BqY3YoA4NNTpccUVbn82Tw1WF6qsvaW5FuIwXSU6nIaoUbx0XSewFEw9ta9m9g7byjEiGU3cGsS7nOWcR7Vb+YZcDwqRrblnQeOWaBiJs8RNUTvvLtfvqbmGTe6SDoZ0hHjHv5tmFHQbCaxeCLF+WpXwOzyxTkj2qjrr5LfkHbVwIbzYZp5nEAncHDfUsR81wfJGGhPhcGhMAbuHuwBfYPzwZOUXN6oDRrFeAYLo6XI4kyQBkKBMOOvh+UzYtgdH/2MyJfxOpSLV26pfbG/X0fsSfmKf6kQa3M/IctFy8QWPdLTXGgCvkTMtIL/BhHkc6v7tH+wyl9flDbfZLQGsLOTbdPuUFBXUIvmvCS+v2ARf3IHclRfX1686zHJeXdyfXxz5ivdy0hTpOmdAMWcQB/7KJjjOBzTKSiivxMbkZJR2rMWLJuvyRYlAKrChDqG9US11eq4EA1vOXBji76hIzFaCeGMCT5jDhUJqsp7hXOLPSBvbGnMOXJVsoX3Cx4VxrdEZZzree4hRTQIWI7LRS7TtISS05q26CjPovjySeXjn95EUDnWU0Db0P48
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|24121999003|15080799012|23021999003|24021099003|19110799012|4140399003|6140399003|12121999013|8060799015|260925184616899003|5072599009|10092599007|39105399006|440099028|3412199025|3430499035|18071099003|26121999007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jjsrf/I6OpO5Gcd8UhlduKmdxKuKpdyMAJLWsqz2yMPyn4rERYH+KZ49i7N2?=
 =?us-ascii?Q?irJxlArjL5qIpT7q4TJllYZ61z80z2ZAta+p7WZuf+Ni8Nja78RS9VfPp1Ip?=
 =?us-ascii?Q?tgzPpHBeluiHGgtvKcZAxuCzNH6wp5GoULIgXREBCP1WOjw57eLTbWqxVMz1?=
 =?us-ascii?Q?qILJHPDcrjQkdW89yV9wUO4Ii1tSPDlgggQcnE7Pf21O/OrgQhTP56LsfaIs?=
 =?us-ascii?Q?QPoYxxgdIUm1UJ1Sra8U0+pwVV5SwamHRnFAy8HUsOMzwcEex7vMDr7y36Oy?=
 =?us-ascii?Q?rGSK04goA7KLExf3PoOWgsVEe5VnhbQyGD3nWN77PoKELc6X8Uz3sMhdkQfY?=
 =?us-ascii?Q?a/BDGR7MATMsUwBLRO8iQv9MgDdeQU5y+Wpxh0PDAQJMnJztDP0pV1UcIt3W?=
 =?us-ascii?Q?R+I6f9s9R+tqVBPhM+vvnEeNZz0BI0OVU7KgtCQ3rrDAGUldbiDB+f1u27XA?=
 =?us-ascii?Q?5C1xkWGybALIdQfHReqRpQffDVS7QxKaVKI3c8YkJ+i1AqNfDvFsChAqIpKg?=
 =?us-ascii?Q?8LhiCZqA0xJ60eFDhj73nvSKXAgJi8JaIfRQgcMu6V7YO7j6A7XsaVU7AmRu?=
 =?us-ascii?Q?6EW6quLhyH30d2bazTrtyr0XH6btAf+qZTJlUUXD4bidpe3t8gBrUDHbL6Lk?=
 =?us-ascii?Q?L+r1HAz8oHMZYWf/d297bsbMzNxbMdAP6Zuwore6axIIL3N4CzA4PN0nvxI/?=
 =?us-ascii?Q?Q61gWC2qMXZkyrCWRSgWmc0ldgdCCcNvXm7QIXMNehnz1r9AI/GMk6Ty/50L?=
 =?us-ascii?Q?dCVRngpNML7OxyyOnoNIUMm9vfzdtwQoLnRwk4sB/7rHhwdwiqlYbOkzHJlJ?=
 =?us-ascii?Q?MZSazrPUVAHDt/GPUkjSuSanwKNA0JtPDhjLsS8eMDioO2VvyJLdSLFcwuXX?=
 =?us-ascii?Q?Mf1wFYhDKyPvs3SrzaTOayoOQec7F0BuN3rUvu/H0Qm0JFlDT/VDLF6rJOl6?=
 =?us-ascii?Q?HXWm9nNfBZ5X5e2N1mCgX5N5JGmlrNQa9e3t3a0eCCGtsmOdXbL4TEx0HJSv?=
 =?us-ascii?Q?7fHd6uFpyH4LkXrs0VWXeGVGMPkQT5vwjNV8YQvoHb5myxPa8w0N/aaxz4Kx?=
 =?us-ascii?Q?CSCn+mhwAlTJbFVz4D/M+tIf4UHDwYIpJoXXY/Qs/HoGrU3dru1qYhGMvNHq?=
 =?us-ascii?Q?sHdawJEsiGQQ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MjAPcddykGw/uHSlPAvFx9eyTiV4vSsQkOscgdlakGBTRQVFSKzlTaEwP6iF?=
 =?us-ascii?Q?H/QH5Y8HluAUZUJL62qkmSZLS+bbJ8rf4fptI4hIqoZBkWGOrBA8Ail02Wgg?=
 =?us-ascii?Q?K89BEtD+lPmACUpc5/B7DaN3t8Ac7ofoQzzPvo1FTZcZDcuzUKPNfijPMaH2?=
 =?us-ascii?Q?tLabAIVcO5RHHY+Vp6pFDNeIZ7hfApERUvmLll8AnmHI+usyBiXAflXRtQK8?=
 =?us-ascii?Q?kVZuf5g393gBnwkNMnaQY+TLIvhJNdeXBmM6izT9JtasH6MilkWzSuGBM1hK?=
 =?us-ascii?Q?JHRe21Q8zG5BZCFYo1Wud0qYHcrnu0JOpXCRj7VOaF3GKv9fQRJI5cqvIxHf?=
 =?us-ascii?Q?I7+D7B51x/KDRpljFQ5BzfZLsJC1OFwkw9xRoSsmwlCsWvqZ/G682RyLUWMs?=
 =?us-ascii?Q?UOeGqtwL7h/P0sqcMlI6QVU76wgH3LWWw2MgdaT48oex/mCJdM19X51dVb12?=
 =?us-ascii?Q?w9iK3xdVi+2eWDW10kPIEsXorbeTJFTgYi9OGB5+IFCTuWRPa2yTdROcpiz1?=
 =?us-ascii?Q?4x5Vk/mjvq+99I8FFB0fOPIXVkkMuM6J3zMNr8TfDLEIctaAqPj2e9nPAYZv?=
 =?us-ascii?Q?0GEaZUS4Bp9k+9qOgcJlkj3AhOTh80bnS9ynqEF2zSN8PEi71r6WVJvc32x7?=
 =?us-ascii?Q?0U8NjrwGfKAHGQm9W/pB3MNpShmFRaRsaACRbZHaEhShUgSTgsfn01MQ/Ed/?=
 =?us-ascii?Q?v05eVIPR278bNYbRuoY/bohcSkbAPnmOv/k3ykuJpTbJJxg4v+8QfIZX13OA?=
 =?us-ascii?Q?iMjMkvqV2KrnyuObF3ONM/6vywOb7rXdQw7u2GEE9H0WEaqWxMWtsFfCE8uo?=
 =?us-ascii?Q?xIIwgGBhmpXngy4aiLAS9AOigGPW5IsHlV24OqfgPEIPAsgYkxrjLf26JzGQ?=
 =?us-ascii?Q?StukelYC/BpIIVkE+gnxHJiA5uUumu0pxeQqNbLQ0hrBaOxD2sXg/6Z/HuNb?=
 =?us-ascii?Q?guTsG+Nxk4Z56o56ViJkkLaRu3hrapcygsKRnFq1rqEJycW9tfo6jToc/AuU?=
 =?us-ascii?Q?iONcDnWeInwhM3Z/DZ9sMz8wuk7DsO4UHY4qtAAz5raypA/Qn8xrHUZyIHXQ?=
 =?us-ascii?Q?5s9ZmIIxFfSkeagvA/030+KWIiz4GED0reAdz3D+4RqpSgSiJDviF/Df4va8?=
 =?us-ascii?Q?/UFJnSNP5cL+XjEYnRQlCP2PTC9wkiZ3ychkecfrM3LCv6B0I8l79bWz0S/W?=
 =?us-ascii?Q?65K+r7Z5lqPGs6VMhrGNJ3mu6aA2TB2RWPBCo7C6wNw57xEno+/LeaUDfxxu?=
 =?us-ascii?Q?6wtME+TZdbX5/mj6RWYW3ti9WjxmGeZeusF0bnuhoRROZls9QwyAR1YFYHAI?=
 =?us-ascii?Q?2drhMwWyKgG5ZWMRrEmokGRrrXombmVAdLe4J605PpRf1u09JuhuRbmi4myi?=
 =?us-ascii?Q?lRYUBy1j/77oS0rvTOdBKUIwG6Tx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fe4936-6c25-42a8-be11-08df4604498d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6658.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:13:54.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8841

On Mon, Oct 19, 2026 at 12:09:59PM -0700, Devin Wittmayer wrote:
> Two of those fixes are mine, so I had a go at it. The code that draws
> the panic screen was moved into drm_panic_helper.c in drm-next, so two of
> the three need to move with it.

[...]

> The drm_panic KUnit tests pass with and without it.

Without it they can hang, depending on what is in the kernel log.

Both fixes are still missing from drm_panic_helper.c in next-20261118
and in today's drm-misc-next and drm-next: kmsg_buf is still 512 bytes
and the empty read check is not there.

On next-20261117, the drm_panic_helper KUnit suite never finishes once
it reaches the kmsg screen cases if the log holds a record longer than
512 bytes. Booting under virtme-ng is enough to trigger it, since its
kernel command line is around 650 characters. The user screen cases
pass, then the suite stalls and the boot never reaches init. One run
sat there for 50 minutes before I killed it.

With your resolution applied on top of next-20261117, all 30 cases
(user and kmsg screens, all three tests) pass and the boot completes.
Tested in x86_64 QEMU/KVM guests with 8 vCPUs and KASAN and lockdep
enabled, with the suite built in and selected with
kunit.filter_glob=drm_panic_helper.

Tested-by: desobei <desobei@outlook.com>

Is anyone planning to send this as a patch for drm-misc-next, or to fold
it into the next drm merge? I'm happy to turn it into a patch if that
helps.

I found this with the help of an AI coding assistant (Claude Opus 5.5).
