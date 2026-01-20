Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065346AEF9;
	Tue, 20 Jan 2026 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937331; cv=fail; b=iJPmxQbieptWKQAuWNrb3YcG1peU5v+v5+8eJDd8OAyiNOmraUaSie1e3ZihTF4c+xo8G+wk2cUkjKpgt4tFen5nQO7XTAseTXNpF1P7QzVDODZRSTfoxbDJXaDbTKX9HwNcUGbSozi6D1wA8sUPaEFPH+kD2GUfrYQ7u7n+Xms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937331; c=relaxed/simple;
	bh=zbh6icQgHTRmv77sHg4fqrHcDfyDmCz42l19+f7rPj4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s7w4S2uNwnYoK6W3I5ps4bhk0b/XUc78t8QvKrkJkqOGxLKpztshml63h0iREsy7RKrPP5TdXwaFRXIL7SQ/fkxe1mpaMY3QNLuMVBa/4i34H3PFAiV10kJ6O1gKCVSJZDM8izexgBlBLbSbOZOj5OZaN6WN/VIm87R1alyWCV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=dj8sGgku; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="dj8sGgku"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60KH3sm4015040;
	Tue, 20 Jan 2026 19:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=zbh6icQ
	gHTRmv77sHg4fqrHcDfyDmCz42l19+f7rPj4=; b=dj8sGgkuMJSTyp0TrMyU0wO
	NwS1by4mdXF6cul75nOimMyAHsxEMqkWU5ydNWwK1txcJ2vaIqPkpOqbmT7wbUKI
	9ZFhLdgJre9KU+DP97lCzphk88pzxoEPq8hUMq1jSt6eG1b1Ta9dYxyatQgGDRlG
	M2b6AqQJKmDtIHNMf2TKA7CLEvO/CZsJQFh7/WhvSLxSjgOHX/hDw+Zue2DF1/Lf
	P3m48ob06Fox2DmzvxUnJYwIEraAKIwSbCCokmPSJHsiDXSCPRDtUNOZBjbdgOXC
	WLNshvkdZx6+sY7yb7FqnQl1frz9Vs5FDZMAJNJHH3ycYpdU4QEuPg5c53XkgMg=
	=
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4brtdck44g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jan 2026 19:28:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRJ4Q6P+NPE80o9KpKNRfoz6oGROrROeJ8Cw2Zl2R4uJZXThdcAUSjTH4j/jo9WsmBwBdYzqpCEEK5XhvHhQE8Isxhe+67IPmyBw0g7VQo5CECagT5DY2DLl2H4fy+R+msDP0MhDBFVbZOy248TMJ3pq2kPeE8xtJ4vEJ0C8cd3eQ/qlV2YYqN7Dz0WXQhWzpZW74v1JlDd2b9rBWFbvhMNRqNgh3rGFsXQlCmS1ewdHV1vep9u1gYufdve9t5bBB531JGeqws45tkeqYJJkKoCeoN7OtgRiJZQ82IoVFL/osMX7SXswD3LLh9HQKbLG+7uNslZO8lyihwlosdWXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbh6icQgHTRmv77sHg4fqrHcDfyDmCz42l19+f7rPj4=;
 b=eDV9xCGpFsNoWPwu54mvq8yPo2Pq/v9Ls83QVzdNwqheGIK5N3TPUuiA/crOgDHN6k8+ksPqP2qiAs66q0PE9zmW4oAbRfeVhrKRaeyRbHOOk/tMjGuPCnsP0IOajkaM6nHTAqfx9EyOBLNsz6MnRpIP7tMXInGsxMX2WlfdnsNDrrHT9B44AO/0EpANz2m5VPe8VFTTspOKVOI6FR/K5M+6EdNpbUAYh7IMz+ew0xXHXAJZGBvi68lqll74eTAHTHiFSo+YfVRujtCMLmMK85EBH9bnrX5IfcNUEFwK632FSqzr810a2INjMCpdnLPcpHRR2nosRVYPnVaHRnL8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV8PR13MB6622.namprd13.prod.outlook.com (2603:10b6:408:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 19:28:23 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 19:28:23 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown
	<broonie@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: manual merge of the mm-nonmm-unstable tree with the
 spdx tree
Thread-Topic: linux-next: manual merge of the mm-nonmm-unstable tree with the
 spdx tree
Thread-Index: AQHcigjdOYxKtbrqrkihnsBatPerl7VbAM6AgABvxvA=
Date: Tue, 20 Jan 2026 19:28:23 +0000
Message-ID:
 <MW5PR13MB5632EA2D99D9A7BF8A4DBF3AFD89A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <aW912Qvlf_n2S8f6@sirena.org.uk>
 <2026012043-borax-cosmetics-0a0a@gregkh>
In-Reply-To: <2026012043-borax-cosmetics-0a0a@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV8PR13MB6622:EE_
x-ms-office365-filtering-correlation-id: da55b2a2-e13b-4660-e4b2-08de585a138e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFJpS2Mzd1JjT1FDeW1YbG8zcWVsUnM0bStELzloYWJCTFMzSWJWTjk0T3pk?=
 =?utf-8?B?aktRb3NsSUJKQXpGZXhSOU9LdVpUempYM2NOWi8wTlErbERpL1hzczI3VnJT?=
 =?utf-8?B?aEtIQzh0bUVQZk1XSnpieUl3cFpwSHNCYVpvdk1UTzdTMm54SGNOaEViTW44?=
 =?utf-8?B?czZFcHF0akV4NkI2WFMvYWttM2t0Q1h6RGJNV2wrSFZURWJrcE1xN0p0S3NW?=
 =?utf-8?B?TVVINWVrbXNmNTMxRHV6cHF4MndmWW1ZUUViR3pwSEQ4L1JmK3gwM0NIWUlU?=
 =?utf-8?B?VE1zU3BqS1UyRHc0c1FDRXlORlJCdHFhVFVNL1I3Umo1OWdsc2Rxci9HN3ZN?=
 =?utf-8?B?T3FSTnJqOGRHQ2xpZytQZ3JaTnNPTzFuMFlYOFFSYWRkME5odmNuSy9Va0tJ?=
 =?utf-8?B?TVcvZk1ycEdxRUdJaTF2NkZHYkIvMElyZTA4M3RURENYZHF3UTNRdGU5aFVk?=
 =?utf-8?B?bXFsdzkxcVZDY2NHeS96aDlWRUxFSWYwTSszS0JpVG5odUdpcll4cDdvRWtS?=
 =?utf-8?B?Q0kzMzBVTGJWM2lWY2M1ZjdxTTdhRG9DNEcrbU5Mby9tQ2RPSDVvY2VUQ3Jn?=
 =?utf-8?B?ZTZncTQ4c0k2cmsrSEpnOTF4VFB2ZzZBeklva29mRld4VFE3R1FYYkY1eGRB?=
 =?utf-8?B?UURKb0dxSjFkZDdHZERKWnNkYUo5clNQTk5EM3h1Z3ZmWVIwcG5DdDNPS09G?=
 =?utf-8?B?aFZmb3pxTldIS1FtekpwMzRiK082VytOblc2My9iM2NkMlVEb0o0cEY3cFFo?=
 =?utf-8?B?VDJBOWJQeEt2RW9EOFFMdjhFMGlldlNrOG1EdWRNMzBjRTNGVmlRVVNaQWha?=
 =?utf-8?B?aWg2cy95ejVXOFNXYnJQc1NNenZiTSsvNEEvNllkdFUrZEl6bzg2SDZOMXhz?=
 =?utf-8?B?alNsdlhXMVJldncrTUg5MndhQXZmUENKbWpKcityUnF1SHFZKysyU3RINGF2?=
 =?utf-8?B?bGFGZ0p4NHZJZW95dFpXTEVUeFdmazlJWkpDeWVzem1KV0ZnL3cweXZwTXVa?=
 =?utf-8?B?MS94bzI5U1ErbUtxamNGMXRlNlN6cUVyNVpDYU1VNEFvYlg5ZU1LNVVKa1J3?=
 =?utf-8?B?WHNWck44QklQa1JTNFgxUzkxR0JleDFSaS9JMFdvVjBTcCtVSGpZbXNBNlFh?=
 =?utf-8?B?b0hsT2tKNHRpYTRJZENJWTJsZ2ZrSUJnTGptd09UUGlhSXMvYTRPNUV2NEN4?=
 =?utf-8?B?WUc4WUdvdlNMcFZYWTRBNnpCMjExNzI1LyttZThBWHJHckgxZ2pJNG4zaXkv?=
 =?utf-8?B?ZlJKcVhKOE5rWHMvRDF3ZmJQc2UrWS8xWXd3aHNWTDdJUDBtYXp4cDh0VzVW?=
 =?utf-8?B?ekgwNnkxeGNvUUc4UWFpejRqaE0rQWI2N1U1Mi8zS0RZQnRzUjAvWnQ3OVhE?=
 =?utf-8?B?T3BYbWFuT2xvK25nWVh0ZUFuMmZwZDI0YmgvTFFEbnoxSGNhcHhIY1pYMEc4?=
 =?utf-8?B?WkNzdElFS2xhcnovdjdYSnByOEJobTZocitiS0NkWXVGVHc1VmI1VmJ4bXU3?=
 =?utf-8?B?M09lY1NKbjgwejJXdDNQNk9qOERtTUxJKzZPM3Y3RGVCSkNiQzBiYm5WMDR1?=
 =?utf-8?B?ZmJUMDZxWDg1TmRUREFEN0VDMlNUZ1FVR1VNNUtoTHR4R3N2STBNOEpHdDJH?=
 =?utf-8?B?UFlDSFR0N1dkdGVWUm5oMElSS1J5S3lCVXVSMDlOZThoT1MybW1CdzJTS2pm?=
 =?utf-8?B?M3lQa0pHYjdBVytOQ2RBamFkYmErSGs5SjFYMG1WL2tnVHY2ZnZRVzl0anNr?=
 =?utf-8?B?aWNHTldjS1hMdXMyTTJPa0RUSHR3WE9rM2lsaExtaUhqVWhjMkRoSEMzYWRy?=
 =?utf-8?B?Ui9WYkRpdld4YVAzd0szeHZ3dWVpbnBLNk5acU5MRTkwRFhpaW1BK3VGM0pB?=
 =?utf-8?B?L2hhd2laYzFJeTA3VVY4UzQ2anVaYkdPWWRwUSt2cjgwMmhQbVNXYlZEZVRM?=
 =?utf-8?B?dk9BRUVLU01hTU13SDR2eWJGT1JtdStJSkJ5SktXWVBYcGRmbmhxUmNVK2pW?=
 =?utf-8?B?S1BjeDY0SVE2VHVxRkh6VUlaZjJIOThoakxHTEZ4NnU0SVRwaG9uVENnbzBq?=
 =?utf-8?B?ZTBsWElzSzRZSkh4dS9zNEU4TG5mSDBxR01ubXZ2QXBkc3RYOFIrWjYzdDBo?=
 =?utf-8?B?eHU4OFUzM2s3SHFnN1AwelFQVnBIYXMvdW1DNUlLaXdwVEFzekRmN2t5Qm5s?=
 =?utf-8?Q?M9wo365JtqbvVwKB1V/61Sk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFBxQVlydzRqd2g0eEpMNy83dFdKRlV4cUlOemlPckovTjN3OVowNmdNWVVX?=
 =?utf-8?B?dDJydHJscUl1eittRlZpbEJ4QzNtQzlLRWJnTTRzMU9pR2dneGJkTUkvWVpr?=
 =?utf-8?B?Vi9jVU5PeUtxRlFDa1ZvbFVWNHhNUUlTNkg1d3V3ekI2UDgyd3dtUVdjdXQx?=
 =?utf-8?B?cnQzbDJtTWlZb09OR2loNTQxMytsTVBYZ0FUUjFnV0pwMEpzRWR2Y09yRVlM?=
 =?utf-8?B?OFpxanFNVWcrMHpCdXBTY3d3ai9wVk5yR3ZVV2xnOHYrbHJxNm0rTHRJK0ZD?=
 =?utf-8?B?RDd4ai9Gc0txSnYyTDBubU1yRnNtS3BnVGUvYmdQR0lMeGdqN2ZIZ1VQdnBa?=
 =?utf-8?B?elB4RDNkb0hnalNjQ3A2TVFmakdBRzZRQUd0RS9jZ1U4cFZyNTZDeWNidzdj?=
 =?utf-8?B?Kzg2dWZFdmF1Y0Z5azdkZmdETjVOL0ZhdFlXNnM4MlFJbWZERVRqNk0xNjRK?=
 =?utf-8?B?emMrOTFaWjVGNXdyTG9qUXNzUlFUWDF6WlRYeWZad2xDRGJPcGdJUml1bGJq?=
 =?utf-8?B?L242TkpiTjJFNGF4QUh3Vi9OSUVMYlY5Z3hXeHZuUlhJS2hYaWNUZHRzeE1p?=
 =?utf-8?B?VXhiNU1LWUdkTHdTUkNVRnR3ZW44dDJNRk1WdmF5eFNTeGUwV0xlTzY2RktB?=
 =?utf-8?B?cUwxOWtvV1NZaFhqeEhiMUhSVk03VWJWZGpmeTRlU2p0U1IzbmE2NEkzbnk4?=
 =?utf-8?B?WnlUZjN1SXVKZlZLUFFPNGhQUWlpaGZiU2tZSVpKRzk3OWYxT2cvemlyYlFT?=
 =?utf-8?B?SDFaTHVDYno1bmd0K3BJL0VoQVNMZW1XUlpmNm1pUnZncWR6WTl3bmZ3emdx?=
 =?utf-8?B?eW1XRko1WXhjbnNtVzNqR3ZVMks3MytlMkZiSWNCRGRSM3E4dE92NFoxc2VY?=
 =?utf-8?B?d1ZXeWN4SDZoaFZxbDk5bjJpTlJML0VTVy9kSUtlMUdYRTNaL3RESDBEaEor?=
 =?utf-8?B?MTJQODMyZkc4NjF5ZXllZ3hneDM3VXJzNWhaYXRhZ0VvTE96bWNaUko0dHNP?=
 =?utf-8?B?S0NIR09Ea0dnYmx6ajlGaFRhOXBqeXNabVY4WnVaU0xJOW9KQ1RjUTNpUGNo?=
 =?utf-8?B?ZXd0bHN4MWFqSmd2ZDNkeDNRVktNcW4zZW1lTDBVeTZaUEhWdUs1OGMrbUVy?=
 =?utf-8?B?ZE1sZE9EM1VZV1RPTnlBM1g1OEtGeXZOa2xHbGx0TnlOMVowMWJnaWlHOG51?=
 =?utf-8?B?YmdoK3VqQ25MV0dOMnY5UWJlQlI2TC9yaUV6bG5kRE82VEtoMldEb0tvbldI?=
 =?utf-8?B?Q2RlcEVTZmlqV3MrbGExeUkvRlFlWS9RYUQxdCtOU0FMcG1wY3VNQVdtdkJX?=
 =?utf-8?B?TWxvbnIrSmNkOUxucEQweEM3bURjQ2lrQmpNL2dsTXhzclBMWkIvTzJrdXpE?=
 =?utf-8?B?RU5xSVJHdmpYSU14MW52SDdDQmExeDVOdzZGTGhWdFJDR1NqRHA2OUhPcTln?=
 =?utf-8?B?QjhiOFVweTJFNllWZkhKSHNycnRtZDFzb1l6eVZOcEdaWDU5cEFSSjkrU091?=
 =?utf-8?B?bE15Zjg0RXg1Ti9keEQzdmxNNnJ3d0Z4UGxnUjRGODJlc0VLMkdQUFlZTTAr?=
 =?utf-8?B?Wlc3RjI5YmdaRDZwbi81VVo5RzhRZ0NySlgzV0I5Q3ZmUEwwaDNQa2hyOHZ5?=
 =?utf-8?B?MVBBR3pGNUQ4SjF1MUpvb2N2RUJ5WUk1UjY0V29nYjZxRE5SMnFNUmhNbGtF?=
 =?utf-8?B?b3U3b3VhcE45dWE2dkdNVDNIUnd3eTFXVGV1a3lpUCtSR1Fxb1F0aWtZdW1a?=
 =?utf-8?B?RkRuQ2EralVoaWtpd2pLUG1DNE9VZVFDRmxoSmt4L0RZMEZFbkFyN1NtRHF5?=
 =?utf-8?B?SUVrNjh5cFZNU1lPMFFpb2hneHNoeGdMUm1zc01UTjJxeW5pS1ZnRDFRZXZi?=
 =?utf-8?B?ZnVMaGZYQjNoNkplWVRKRlN6VnMyQ3U5YUF4RVg1ZEJzanpMcjRSV0RKUGhO?=
 =?utf-8?B?czVuZmJEYWJ1d3dGU1RsNG5ROFhIMzV4Y2pkbURvek1WYjBGTmF4VEVMSHQ3?=
 =?utf-8?B?U0dFMGNHUWNMYnU5TWVMSndCdHFNTDcyQmlDUkJ5SmNQNVhPeDRWc1lnclh1?=
 =?utf-8?B?amNvVjFHR3hoWUxmc2xYVkY5bDFCNzVyT3BLdGpUTUw1ZzZiZFZEcDRESmFa?=
 =?utf-8?B?UTBPWmVVZmsyK0xDK1hFeEFVVGRtbERkMHBncTl3ei9xUDV6SWtlRTZuMVBH?=
 =?utf-8?B?SHRmNmR2c3krOFdabkNxbXVFK1Rxd3lDYkpZazI3TlZQOXJ6RSt0QmQ5Z2RH?=
 =?utf-8?B?UUlEczhycHhpd3pOQ1hYa1dNckVWNGU2SFJjK1lYU2JvWVExNHhUMktPM1Jz?=
 =?utf-8?Q?mCelO1T7vyTdiwBlTF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CwtS0RgzCyo8SwMTc3EJF8v5kne6CDcvf1xY5KUbI2m1Tz0nD8pkZrwmNcyPR98apwfg3/PZC8bmY7ZxAG/Uz1OrHgEVlyfyq4ZHHJid+wEWsaWjOQeIpu0QtsS18KZwQAj4bTMgzUOktBvO+HoWnlx4An3oiQAWhAAR1+xQnRSpvgb8azFjAZv19u/bkltdEdUyZVxnQvqC476CL83MbV8k2VTRIRqhHCiU9wAAZ+vakd1g9+PRXNuDW2084x+Ojwf4KvZtYsmeWAtkuFuE+krnHo8whOKqPNonsHYmyZkOCbVrHTrWZ4x0BvAfIOAYv4l9SV1Jkf8Pkte3Uvkyw1tsyrHhhOUjtaPS2bx3yXbCKuBa1+Sw1+n/uNI1F4rCVvNTV5mjD1o0ydk3KRg9Fgta8N1NXcYnMYthPbIPCVE3uBvBvMRSqKK2b4GcLyMTWvC1fH0BfzL86WQwKrv539imeAQfWvDFmOy1flvxgbhSxjxDEg6XZgS2kvjvh/Ug+QpEd9X5MJqrGK/eYcL2WliN8jz39sNrUTXG63z0m75P4sAeT7OyWOyQRaNM3VyDensAWjJ6nohhzWk8hFGIonlo/34UGt7QwbrYQOPTnwviPLmrarpcsYFw5GXSQCfb
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da55b2a2-e13b-4660-e4b2-08de585a138e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:28:23.1063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHP1uby92QGKRnY071tMspRzqh8/UvfmCnjkSK44GJZ1kzROk9X78RlL5X7H6U//OegT7CzEelnYb6KV2vcEyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6622
X-Proofpoint-GUID: DbllxczzfZeS4DEi5Ly1auTXGOrpk6oq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE2MyBTYWx0ZWRfX3FE7ii2IdWP4 U/HI31pMnbu9aXIga8C7Xc0UaqmUm0GW5CcEOuckVO3jA4Jn2tAcP03L8yJVRc1+kYAUydxLhOd TvC0DOIem2FktxVoSNfdZZzxWAmlq3bnmCREkZuJx3jxKzN3vsKJp0AyIPOUWjCz3UoKae3lCxw
 p0k+zjHEj4EP+cclLzntLDaxa6zZxI2QcXzjlQTxrA6V1fy4zY+ut3+6vu2l3Xi6zYfKViRVe8J iPhBgkEDi1G8zoUg/gFHdGFwnmkfVlv1dJ4e9cAxYNz4q3k0zaoHpPqcvp/kuedhdcjIM2JNq+f P2URMpSbsMHZtoW8bm6zJQLadQPvfENdmlhIgiP/LsOWR/ZxUhwHmUUsIIxxqvzCFne5Mj9NMjY
 yCBOxXjYblMaib5Jai5YkQBr1DX9NpMfboHwvp4G+oeO6d2zXO6bijbCaR8IzkgERJhhU7HTLIY pJZbnw8ZiazULmZldRA==
X-Proofpoint-ORIG-GUID: DbllxczzfZeS4DEi5Ly1auTXGOrpk6oq
X-Authority-Analysis: v=2.4 cv=XpD3+FF9 c=1 sm=1 tr=0 ts=696fd75c cx=c_pps a=021mb8W6rIxzgUEI7A/+3A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=z6gsHLkEAAAA:8 a=217aLbuwkW1_cpe-OwgA:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Sony-Outbound-GUID: DbllxczzfZeS4DEi5Ly1auTXGOrpk6oq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIw
LCAyMDI2IDU6NDQgQU0NCj4gVG86IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4g
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+OyBMaW51eCBLZXJu
ZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgTGludXggTmV4
dCBNYWlsaW5nIExpc3QgPGxpbnV4LQ0KPiBuZXh0QHZnZXIua2VybmVsLm9yZz47IEJpcmQsIFRp
bSA8VGltLkJpcmRAc29ueS5jb20+DQo+IFN1YmplY3Q6IFJlOiBsaW51eC1uZXh0OiBtYW51YWwg
bWVyZ2Ugb2YgdGhlIG1tLW5vbm1tLXVuc3RhYmxlIHRyZWUgd2l0aCB0aGUgc3BkeCB0cmVlDQo+
IA0KPiBPbiBUdWUsIEphbiAyMCwgMjAyNiBhdCAxMjrigIozMjrigIoyNVBNICswMDAwLCBNYXJr
IEJyb3duIHdyb3RlOiA+IEhpIGFsbCwgPiA+IFRvZGF5J3MgbGludXgtbmV4dCBtZXJnZSBvZiB0
aGUgbW0tbm9ubW0tdW5zdGFibGUgdHJlZSBnb3QgYQ0KPiBjb25mbGljdCBpbjogPiA+IGtlcm5l
bC9jcHUu4oCKYyA+ID4gYmV0d2VlbiBjb21taXQ6ID4gPiAzMzBlYjk1NWVhOWU3ICgia2VybmVs
OiBhZGQNCj4gT24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTI6MzI6MjVQTSArMDAwMCwgTWFyayBC
cm93biB3cm90ZToNCj4gPiBIaSBhbGwsDQo+ID4NCj4gPiBUb2RheSdzIGxpbnV4LW5leHQgbWVy
Z2Ugb2YgdGhlIG1tLW5vbm1tLXVuc3RhYmxlIHRyZWUgZ290IGEgY29uZmxpY3QgaW46DQo+ID4N
Cj4gPiAgIGtlcm5lbC9jcHUuYw0KPiA+DQo+ID4gYmV0d2VlbiBjb21taXQ6DQo+ID4NCj4gPiAg
IDMzMGViOTU1ZWE5ZTcgKCJrZXJuZWw6IGFkZCBTUERYLUxpY2Vuc2UtSWRlbnRpZmllciBsaW5l
cyIpDQo+ID4NCj4gPiBmcm9tIHRoZSBzcGR4IHRyZWUgYW5kIGNvbW1pdDoNCj4gPg0KPiA+ICAg
MzA4MTFiMzFmYWMzMiAoImtlcm5lbDogYWRkIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyIGxpbmVz
IikNCj4gPg0KPiA+IGZyb20gdGhlIG1tLW5vbm1tLXVuc3RhYmxlIHRyZWUuDQo+ID4NCj4gPiBJ
IGZpeGVkIGl0IHVwIChzZWUgYmVsb3cpIGFuZCBjYW4gY2FycnkgdGhlIGZpeCBhcyBuZWNlc3Nh
cnkuIFRoaXMNCj4gPiBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQgaXMgY29uY2Vy
bmVkLCBidXQgYW55IG5vbiB0cml2aWFsDQo+ID4gY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9u
ZWQgdG8geW91ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4geW91ciB0cmVlDQo+ID4gaXMgc3Vi
bWl0dGVkIGZvciBtZXJnaW5nLiAgWW91IG1heSBhbHNvIHdhbnQgdG8gY29uc2lkZXIgY29vcGVy
YXRpbmcNCj4gPiB3aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGljdGluZyB0cmVlIHRv
IG1pbmltaXNlIGFueSBwYXJ0aWN1bGFybHkNCj4gPiBjb21wbGV4IGNvbmZsaWN0cy4NCj4gPg0K
PiA+IGRpZmYgLS1jYyBrZXJuZWwvY3B1LmMNCj4gPiBpbmRleCA1MTg1YzBiZTg0N2EwLGE3YTFj
ZjhlYThlMDguLjAwMDAwMDAwMDAwMDANCj4gPiAtLS0gYS9rZXJuZWwvY3B1LmMNCj4gPiArKysg
Yi9rZXJuZWwvY3B1LmMNCj4gDQo+IE9kZCBkaWZmLCBkaWQgc29tZXRoaW5nIGdvIHdyb25nPw0K
DQpCb3RoIEdyZWcgYW5kIEFuZHJldyBwaWNrZWQgdXAgdGhpcyBwYXRjaC4NCkkgc2hvdWxkIGhh
dmUgY2F1Z2h0IHRoaXMgYW5kIHRvbGQgb25lIG9yIHRoZSBvdGhlciB0byBkcm9wIGl0LCBJIGd1
ZXNzLg0KSXMgdGhhdCB0aGUgcmlnaHQgYXBwcm9hY2g/DQoNClNwZWNpZmljIHRvIHRoaXMgcGF0
Y2gsIHdobyB3aWxsIGNhcnJ5IGl0IGludG8gdGhlIHJlbGVhc2U/DQoNClNvcnJ5IGZvciB0aGUg
cHJvYmxlbS4NCiAtLSBUaW0NCg0K
